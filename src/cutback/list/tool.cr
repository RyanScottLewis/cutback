class Cutback::List::Tool < Cutback::List(String)

  def initialize
    @all["archiver"]   = "tar"
    @all["checker"]    = "sha512sum"
    @all["compressor"] = "xz"
    @all["finder"]     = "find"
    @all["reader"]     = "cat"
    @all["viewer"]     = "pv"
  end

  key_delegate(archiver)
  key_delegate(checker)
  key_delegate(compressor)
  key_delegate(finder)
  key_delegate(reader)
  key_delegate(viewer)

end

