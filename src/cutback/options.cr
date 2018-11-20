class Cutback::Options

  property help             = false
  property version          = false
  property config           : String?
  property output           = "."
  property date             = Time.utc_now
  property index            = 0
  property paths            = [] of String
  property excludes         = [] of String
  property records          = [] of String
  property format           = "yaml"
  property compress         = false
  property compress_level   = 3
  property compress_threads = 0
  property progress         = false
  property toolchain        = Toolchain.new

end

