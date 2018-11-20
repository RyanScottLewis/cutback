class Cutback::Metadata::Archive

  Cutback.mapping({
    compression: { type: Compression },
    checksum:    { type: Checksum },
  })

  def initialize(@compression, @checksum)
  end

end

