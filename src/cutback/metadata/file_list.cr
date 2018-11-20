class Cutback::Metadata::FileList

  Cutback.mapping({
    count: Int32,
    size:  Size,
  })

  def initialize(@count, @size)
  end

end

