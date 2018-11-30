class Cutback::Metadata::Size < Cutback::Metadata

  Cutback.mapping({
    bytes: UInt64,
    human: String,
  })

  def initialize(@bytes, @human)
  end

  def initialize(@bytes)
    @human = FileSize.convert(@bytes)
  end

end

