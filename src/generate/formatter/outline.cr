class Generate::Formatter::Outline < Generate::Formatter

  @root : App::Root

  def initialize(@root)
  end

  def to_s(io)
    version = "v#{@root.version}"

    io << [@root.name, version, "-", @root.summary].flatten.join(" ")
  end

end

