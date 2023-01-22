abstract class Cutback::Metadata::FileList < Cutback::Metadata

  property count : Int32
  property size  : Size

  def initialize(@count, @size)
  end

  def initialize(path)
    size = FileListCalculator.calculate(path)

    @count = size.count
    @size  = Size.new(size.bytes)
  end

end

