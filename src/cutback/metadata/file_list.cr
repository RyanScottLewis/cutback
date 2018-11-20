class Cutback::Metadata::FileList


  Cutback.mapping({
    count: { type: Int32 },
    size:  { type: Size },
  })

  def initialize(@count, @size)
  end

end

