class Cutback::List::Tool < Cutback::List(String)

  @options : Options

  def initialize(@options)
    @all["archiver"]   = "tar"
    @all["checker"]    = "sha512sum"
    @all["compressor"] = "xz"
    @all["finder"]     = "find"
    @all["reader"]     = "cat"
    @all["viewer"]     = "pv"
  end

  macro update_tool(name)
    @all[{{name.id.stringify}}] = @options.{{name}}.not_nil! unless @options.{{name}}.nil?
  end

  def update
    update_tool(archiver)
    update_tool(checker)
    update_tool(compressor)
    update_tool(finder)
    update_tool(reader)
    update_tool(viewer)
  end

  key_delegate("archiver")
  key_delegate("checker")
  key_delegate("compressor")
  key_delegate("finder")
  key_delegate("reader")
  key_delegate("viewer")

end
