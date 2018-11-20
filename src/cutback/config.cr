class Cutback::Config

  def self.load(path)
    extname = File.extname(path).gsub(/yml$/, "yaml")

    case extname
    when ".yaml"
      from_yaml(File.read(path))
    when ".json"
      from_json(File.read(path))
    else
      raise Error::InvalidExtension.new
    end
  end

  Cutback.mapping({
    output:   String?,
    paths:    Array(String)?,
    excludes: Array(String)?,
    records:  Array(String)?,
    format:   String?,
    compress: Bool?,
    progress: Bool?,
  })

  def update_options(options : Options) # TODO: Macro for these..
    options.output   = @output.not_nil!   unless @output.nil?
    options.paths    = @paths.not_nil!    unless @paths.nil?
    options.excludes = @excludes.not_nil! unless @excludes.nil?
    options.records  = @records.not_nil!  unless @records.nil?
    options.format   = @format.not_nil!   unless @format.nil?
    options.compress = @compress.not_nil! unless @compress.nil?
    options.progress = @progress.not_nil! unless @progress.nil?
  end

end

