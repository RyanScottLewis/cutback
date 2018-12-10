# Standard library
require "json"
require "logger"
require "option_parser"
require "yaml"

# Shards
require "baked_file_system"

# Application
require "./cutback/embed"

require "./cutback/helpers/**"

require "./cutback/*"

require "./cutback/list/**"
require "./cutback/processor/**"
require "./cutback/formatter/**"
require "./cutback/definition/**"
require "./cutback/validator/**"
require "./cutback/generator/**"
require "./cutback/command/**"
require "./cutback/metadata/**"
require "./cutback/controller/**"

