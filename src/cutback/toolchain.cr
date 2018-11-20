class Cutback::Toolchain

  MKDIR    = "mkdir"
  TAR      = "tar"
  PV       = "pv"
  FIND     = "find"
  CHECKSUM = "sha512sum"
  COMPRESS = "xz"

  Cutback.mapping({
    mkdir:    { type: String, default: MKDIR },
    tar:      { type: String, default: TAR },
    pv:       { type: String, default: PV },
    find:     { type: String, default: FIND },
    checksum: { type: String, default: CHECKSUM },
    compress: { type: String, default: COMPRESS },
  })

  property mkdir    : String = MKDIR
  property tar      : String = TAR
  property pv       : String = PV
  property find     : String = FIND
  property checksum : String = CHECKSUM
  property compress : String = COMPRESS

  def initialize
  end

end

