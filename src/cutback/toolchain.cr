class Cutback::Toolchain

  MKDIR    = "mkdir"
  TAR      = "tar"
  PV       = "pv"
  FIND     = "find"
  SUM      = "sha512sum"
  COMPRESS = "xz"

  Cutback.mapping({
    mkdir:    { type: String, default: MKDIR },
    tar:      { type: String, default: TAR },
    pv:       { type: String, default: PV },
    find:     { type: String, default: FIND },
    sum:      { type: String, default: SUM },
    compress: { type: String, default: COMPRESS },
  })

  property mkdir    : String = MKDIR
  property tar      : String = TAR
  property pv       : String = PV
  property find     : String = FIND
  property sum      : String = SUM
  property compress : String = COMPRESS

  def initialize
  end

end

