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

require "./cutback/helpers/**"

require "./cutback/*"

require "./cutback/metadata/**"
require "./cutback/processor/**"
require "./cutback/validator/**"
require "./cutback/command/**"

require "./cutback/controller/resource"
require "./cutback/controller/**"

