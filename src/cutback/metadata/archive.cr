class Cutback::Metadata::Archive

  Cutback.mapping({
    compression: Compression,
    size:        Size,
  })

  def initialize(@compression, @size)
  end

end

