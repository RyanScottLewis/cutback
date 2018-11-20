class Cutback::Options

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
    config:    { type: String? },
    output:    { type: String,        default: "." },
    date:      { type: Time,          default: Time.utc_now },
    index:     { type: Int32,         default: 0 },
    paths:     { type: Array(String), default: [] of String },
    excludes:  { type: Array(String), default: [] of String },
    records:   { type: Array(String), default: [] of String },
    progress:  { type: Bool? },
    format:    { type: String,        default: "yaml" },
    toolchain: { type: Toolchain,     default: Toolchain.new },
  })

  property help      = false
  property version   = false
  property config    = nil
  property output    = "."
  property date      = Time.utc_now
  property index     = 0
  property paths     = [] of String
  property excludes  = [] of String
  property records   = [] of String
  property progress  = nil
  property format    = "yaml"
  property toolchain = Toolchain.new

  def initialize
  end

  def dump(format="yaml")
    case format
    when "yaml" then to_yaml
    when "json" then to_json
    else
      raise Error::InvalidFormat.new
    end
  end

end

