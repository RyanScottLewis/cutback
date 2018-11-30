abstract class Cutback::Metadata::FileList < Cutback::Metadata

  mapping({
    count: Int32,
    size:  Size,
  })

  def initialize(@count, @size)
  end

  def initialize(path)
    data   = File.read(path)
    @count = data.count('\n')

    bytes = data.lines.sum { |path| File.size(path) }
    @size = Size.new(bytes)
  end

end

