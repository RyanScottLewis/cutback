class Cutback::ToolList

  TOOLS = {
    archiver:   "tar",
    checker:    "sha512sum",
    compressor: "xz",
    finder:     "find",
    reader:     "cat",
    viewer:     "pv",
  }

  property archiver   : String = TOOLS[:archiver]
  property checker    : String = TOOLS[:checker]
  property compressor : String = TOOLS[:compressor]
  property finder     : String = TOOLS[:finder]
  property reader     : String = TOOLS[:reader]
  property viewer     : String = TOOLS[:viewer]

  @options : Options

  def initialize(@options)
  end

  def [](name)
    case name
      when :archiver   then @archiver
      when :checker    then @checker
      when :compressor then @compressor
      when :finder     then @finder
      when :reader     then @reader
      when :viewer     then @viewer
    end
  end

  macro update_tool(name)
    @{{name}} = @options.{{name}}.not_nil! unless @options.{{name}}.nil?
  end

  def update
    update_tool(compressor) # TODO: All the tools
  end

end

