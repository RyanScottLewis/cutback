class Cutback::Metadata::Archive

  Cutback.mapping({
    compression: { type: Compression },
    size: { type: Size },
  })

  def initialize(@compression, @size)
  end

end

