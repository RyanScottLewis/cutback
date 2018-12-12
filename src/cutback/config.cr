# TODO: I Hate this but it is a quick fix for:
#
#   in src/cutback/config.cr:18: undefined constant Cutback::Options
#
#     include Helpers::Options::Updatable(Cutback::Options)
class Cutback::Options; end

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

  include Helpers::Dumpable
  include Helpers::Options::Properties::Config
  include Helpers::Options::Updatable(Options)

  def initialize(options : Options)
    update(options)
  end

end

