# Standard library
require "json"
require "logger"
require "option_parser"
require "yaml"

# Standard library extensions
require "./ext/logger"

# Shards
require "baked_file_system"

# Application
require "./cutback/embed"

module Cutback

  HELP    = Embed.get("help").gets_to_end
  VERSION = Embed.get("version").gets_to_end

end

require "./cutback/helpers/**"

require "./cutback/*"

require "./cutback/metadata/**"
require "./cutback/processor/**"
require "./cutback/validator/**"
require "./cutback/command/**"

require "./cutback/controller/resource"
require "./cutback/controller/**"

