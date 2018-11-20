class Cutback::Metadata::Size

  Cutback.mapping({
    bytes: { type: UInt64 },
    human: { type: String },
  })

  def initialize(@bytes, @human)
  end

  def initialize(@bytes)
    @human = FileSize.convert(@bytes)
  end

end

