class Cutback::Metadata::Size < Cutback::Metadata

  property bytes : Int64
  property human : String

  def initialize(@bytes, @human)
  end

  def initialize(@bytes)
    @human = FileSize.convert(@bytes)
  end

end

