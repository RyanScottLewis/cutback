class Cutback::Metadata::Archive < Cutback::Metadata

  mapping({
    compression: Compression,
    size:        Size,
  })

  def initialize(@compression, @size)
  end

  def initialize(options : Options, paths : PathList, tools : ToolList, manifest : Manifest)
    bytes = paths.archive.size
    @size = Size.new(bytes)

    ratio        = bytes.to_f / manifest.size.bytes.to_f
    @compression = Compression.new(tools.compressor, options.compress, ratio)
  end

end

