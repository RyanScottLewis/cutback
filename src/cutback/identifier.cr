class Cutback::Identifier

  REGEXP = /(\d{4}-\d{2}-\d{2})-(\d+)/

  def self.parse(value) # TODO: Needed?
    instance = new(Time.utc_now, 0)
    instance.parse(value)

    instance
  end

  # TODO: Dont like this here - Processor::Identifier?
  def self.largest_index(path : String, date : Time)
    paths    = Dir.glob(File.join(path, date.to_s("%F") + "*"))
    ids      = paths.map { |path| parse(path) }
    indicies = ids.map(&.index)

    return nil if indicies.empty?

    indicies.max
  end

  property date  = Time.utc_now
  property index = 0

  # TODO: Dont like this here - Processor::Identifier?
  def increment_largest(options : Options)
    index = self.class.largest_index(options.output, options.date)

    @index = index.as(Int32) + 1 unless index.nil?
  end

  def parse(value : String)
    match = value.match(REGEXP)

    raise Error::InvalidIdentifier.new if match.nil?

    match = match.not_nil!

    @date  = Time.parse_utc(match[1], "%F") # TODO: Helper for this
    @index = match[2].to_i
  end

  def to_s(io)
    io << @date.to_s("%F")
    io << "-"
    io << "%03d" % @index
  end

end

