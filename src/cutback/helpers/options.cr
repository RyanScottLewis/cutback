# NOTE: This file was automatically generated
#       Any changes to this file will be overwritten.
#
#       To update:
#         * Edit app.yml
#         * Run `make src/cutback/helpers/options.cr`

# TODO: Template is ugly as sin, but output is pretty =]
#       A hash-like interface or something would be better so much better than generating all this

module Cutback::Helpers::Options::Properties::Base

  property help             = false
  property version          = false
  property dry              = false
  property force            = false
  property config           : String?
  property output           = "."
  property date             = Time.utc
  property index            : Int32?
  property paths            = [] of String
  property excludes         = [] of String
  property records          = [] of String
  property format           = "yaml"
  property progress         = false
  property compress         = false
  property compress_level   = 3
  property compress_threads = 0
  property finder           = "find"
  property archiver         = "tar"
  property compressor       = "xz"
  property checker          = "sha512sum"
  property reader           = "cat"
  property viewer           = "pv"

end

module Cutback::Helpers::Options::Properties::Prototype

  property help             : Bool?
  property version          : Bool?
  property dry              : Bool?
  property force            : Bool?
  property config           : String?
  property output           : String?
  property date             : Time?
  property index            : Int32?
  property paths            : Array(String)?
  property excludes         : Array(String)?
  property records          : Array(String)?
  property format           : String?
  property progress         : Bool?
  property compress         : Bool?
  property compress_level   : Int32?
  property compress_threads : Int32?
  property finder           : String?
  property archiver         : String?
  property compressor       : String?
  property checker          : String?
  property reader           : String?
  property viewer           : String?

end

module Cutback::Helpers::Options::Properties::Config

  include Helpers::Mappable

  property help             : Bool?
  property version          : Bool?
  property dry              : Bool?
  property force            : Bool?
  property config           : String?
  property output           : String?
  property date             : Time?
  property index            : Int32?
  property paths            : Array(String)?
  property excludes         : Array(String)?
  property records          : Array(String)?
  property format           : String?
  property progress         : Bool?
  property compress         : Bool?
  property compress_level   : Int32?
  property compress_threads : Int32?
  property finder           : String?
  property archiver         : String?
  property compressor       : String?
  property checker          : String?
  property reader           : String?
  property viewer           : String?

end

module Cutback::Helpers::Options::Definitions

  PATH_DELIMITER = ";" # TODO: Better place for this

  macro define_option(name, short, type)
    {% if type.id == "bool" %}
      @option_parser.on("-{{short}}", "--{{name}}",       "") {         @prototype.{{name.id}} = true }
    {% elsif type.id == "string" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = value }
    {% elsif type.id == "list" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = value.split(/#{PATH_DELIMITER}+/) }
    {% elsif type.id == "date" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = Time.parse_utc(value, "%F") } # TODO: Helper for this
    {% elsif type.id == "integer" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = value.to_i }
    {% end %}
  end

  protected def define_options
    define_option(help,             h, bool)
    define_option(version,          v, bool)
    define_option(dry,              D, bool)
    define_option(force,            F, bool)
    define_option(config,           c, string)
    define_option(output,           o, string)
    define_option(date,             d, date)
    define_option(index,            i, integer)
    define_option(paths,            p, list)
    define_option(excludes,         e, list)
    define_option(records,          r, list)
    define_option(format,           f, string)
    define_option(progress,         P, bool)
    define_option(compress,         C, bool)
    define_option(compress_level,   l, integer)
    define_option(compress_threads, t, integer)
    define_option(finder,           S, string)
    define_option(archiver,         a, string)
    define_option(compressor,       x, string)
    define_option(checker,          s, string)
    define_option(reader,           R, string)
    define_option(viewer,           w, string)
  end

end

# Usage:
# ```
# include Options::Updatable(Config)    # i.e. Update options from config
# include Options::Updatable(Prototype) # i.e. Update options from prototype
# include Options::Updatable(Options)   # i.e. Update config from options
# ```
module Cutback::Helpers::Options::Updatable(T)

  macro update_from_source(name)
    @{{name}} = source.{{name}}.not_nil! unless source.{{name}}.nil?
  end

  def update(source : T)
    update_from_source(help)
    update_from_source(version)
    update_from_source(dry)
    update_from_source(force)
    update_from_source(config)
    update_from_source(output)
    update_from_source(date)
    update_from_source(index)
    update_from_source(paths)
    update_from_source(excludes)
    update_from_source(records)
    update_from_source(format)
    update_from_source(progress)
    update_from_source(compress)
    update_from_source(compress_level)
    update_from_source(compress_threads)
    update_from_source(finder)
    update_from_source(archiver)
    update_from_source(compressor)
    update_from_source(checker)
    update_from_source(reader)
    update_from_source(viewer)
  end

end

