class Cutback::ToolList

  TOOLS = {
    archiver:   "tar",
    checker:    "sha512sum",
    compressor: "xz",
    finder:     "find",
    reader:     "cat",
    viewer:     "pv",
  }

  Cutback.mapping({
    archiver:   { type: String, getter: false, setter: false, default: TOOLS[:archiver] },
    checker:    { type: String, getter: false, setter: false, default: TOOLS[:checker] },
    compressor: { type: String, getter: false, setter: false, default: TOOLS[:compressor] },
    finder:     { type: String, getter: false, setter: false, default: TOOLS[:finder] },
    reader:     { type: String, getter: false, setter: false, default: TOOLS[:reader] },
    viewer:     { type: String, getter: false, setter: false, default: TOOLS[:viewer] },
  })

  property archiver   = TOOLS[:archiver]
  property checker    = TOOLS[:checker]
  property compressor = TOOLS[:compressor]
  property finder     = TOOLS[:finder]
  property reader     = TOOLS[:reader]
  property viewer     = TOOLS[:viewer]

  def initialize
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

end

