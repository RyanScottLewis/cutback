class Cutback::Metadata::FileList

  class Size

    Cutback.mapping({
      bytes: { type: UInt64 },
      human: { type: String },
    })

    def initialize(@bytes, @human)
    end

  end

  Cutback.mapping({
    count: { type: Int32 },
    size:  { type: Size },
  })

  def initialize(@count, @size)
  end

end

