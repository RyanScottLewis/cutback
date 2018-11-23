class Cutback::Identifier

  REGEXP = /(\d{4}-\d{2}-\d{2})-(\d+)/

  def self.parse(value) # TODO: Needed?
    instance = new(Time.utc_now, 0)
    instance.parse(value)

    instance
  end

  def self.largest(path : String, date : Time)
    paths    = Dir.glob(File.join(path, date.to_s("%F") + "*"))
    ids      = paths.map { |path| parse(path) }
    indicies = ids.map(&.index)

    return 0 if indicies.empty?

    indicies.max || 0
  end

  property date  = Time.utc_now
  property index = 0

  def initialize(@date, @index)
  end

  def initialize(options : Options)
    update(options)
  end

  def update(options : Options)
    @date  = options.date
    @index = options.index
  end

  def parse(value : String)
    match = value.match(REGEXP)

    raise Error::InvalidIdentifier.new if match.nil?

    match = match.not_nil!

    @date  = Time.parse_utc(match[1], "%F")
    @index = match[2].to_i
  end

  def to_s(io)
    io << @date.to_s("%F")
    io << "-"
    io << "%03d" % @index
  end

end

