class Cutback::Options

  class Prototype

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
    property compressor       : String?

  end

  @arguments : Array(String)

  def initialize(@arguments)
  end

  property help             = false
  property version          = false
  property dry              = false
  property force            = false
  property config           : String?
  property output           = "."
  property date             = Time.utc_now
  property index            : Int32?
  property paths            = [] of String
  property excludes         = [] of String
  property records          = [] of String
  property format           = "yaml"
  property progress         = false
  property compress         = false
  property compress_level   = 3
  property compress_threads = 0
  property compressor       = "xz"

  macro update_option(parent, name)
    @{{name}} = {{parent}}.{{name}}.not_nil! unless {{parent}}.{{name}}.nil?
  end

  def update(config : Config)
    update_option(config, output)
    update_option(config, paths)
    update_option(config, excludes)
    update_option(config, records)
    update_option(config, format)
    update_option(config, progress)
    update_option(config, compress)
  end

  def update(prototype : Prototype)
    update_option(prototype, help)
    update_option(prototype, version)
    update_option(prototype, dry)
    update_option(prototype, force)
    update_option(prototype, config)
    update_option(prototype, output)
    update_option(prototype, date)
    update_option(prototype, index)
    update_option(prototype, paths)
    update_option(prototype, excludes)
    update_option(prototype, records)
    update_option(prototype, format)
    update_option(prototype, progress)
    update_option(prototype, compress)
    update_option(prototype, compress_level)
    update_option(prototype, compress_threads)
    update_option(prototype, compressor)
  end

  def process
    Processor::Options.process(@arguments, self)
  end

  def validate
    Validator::Options.validate(self)
  end

end

