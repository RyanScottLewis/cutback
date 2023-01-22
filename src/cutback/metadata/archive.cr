class Cutback::Metadata::Archive < Cutback::Metadata

  property compression : Compression
  property size        : Size

  def initialize(@compression, @size)
  end

  def initialize(options : Options, paths : List::Path, tools : List::Tool, manifest : Manifest)
    bytes = paths.archive.size
    @size = Size.new(bytes)

    ratio        = bytes.to_f / manifest.size.bytes.to_f
    @compression = Compression.new(tools.compressor, options.compress, ratio)
  end

  def initialize(options : Options, paths : List::Path, tools : List::Tool)
    manifest = Cutback::Metadata::Manifest.new(paths)

    # TODO: CODE IS REPEATED, but crystal doesnt support instance variable initialization in helper methods ='[
    bytes = paths.archive.size
    @size = Size.new(bytes)

    ratio        = bytes.to_f / manifest.size.bytes.to_f
    @compression = Compression.new(tools.compressor, options.compress, ratio)
  end

end

