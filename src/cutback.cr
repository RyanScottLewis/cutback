require "yaml"
require "json"
require "option_parser"

require "baked_file_system"

require "./cutback/embed"

module Cutback

  HELP    = Embed.get("help").gets_to_end
  VERSION = Embed.get("version").gets_to_end

  macro mapping(value)
    YAML.mapping({{value}})
    JSON.mapping({{value}})
  end

end

require "./cutback/helpers/**"

require "./cutback/command/base"
require "./cutback/metadata/base"
require "./cutback/processor/base"
require "./cutback/route/base"
require "./cutback/validator/base"

require "./cutback/**"

Cutback::Application.execute

