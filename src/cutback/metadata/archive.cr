class Cutback::Metadata::Archive < Cutback::Metadata::Base

  Cutback.mapping({
    compression: Compression,
    size:        Size,
  })

  def initialize(@compression, @size)
  end

  def initialize(options : Options, paths : PathList, tools : ToolList, manifest : Manifest)
    bytes = File.size(paths.archive)
    @size = Size.new(bytes)

    ratio        = bytes.to_f / manifest.size.bytes.to_f
    @compression = Compression.new(tools.compressor, options.compress, ratio)
  end

end

