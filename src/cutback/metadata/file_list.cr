abstract class Cutback::Metadata::FileList < Cutback::Metadata

  mapping(
    count: Int32,
    size:  Size,
  )

  def initialize(@count, @size)
  end

  def initialize(path)
    size = FileListCalculator.calculate(path)

    @count = size.count
    @size  = Size.new(size.bytes)
  end

end

