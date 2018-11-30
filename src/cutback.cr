# Point of entry to the cutback application

require "json"
require "logger"
require "option_parser"
require "yaml"

require "baked_file_system"

require "./cutback/embed"

# HAX
class Logger
  property io
end

module Cutback

  HELP    = Embed.get("help").gets_to_end
  VERSION = Embed.get("version").gets_to_end

  macro mapping(value)
    YAML.mapping({{value}})
    JSON.mapping({{value}})
  end

end

require "./cutback/helpers/**"

require "./cutback/*"

require "./cutback/metadata/**"
require "./cutback/processor/**"
require "./cutback/validator/**"
require "./cutback/command/**"

require "./cutback/controller/resource"
require "./cutback/controller/**"

Cutback::Application.execute

