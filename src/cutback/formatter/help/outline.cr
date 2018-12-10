class Cutback::Formatter::Help::Outline < Cutback::Formatter

  @root : Definition::Root

  def initialize(@root)
  end

  def to_s(io)
    version = "v#{@root.version}"

    io << [@root.name, version, "-", @root.summary].flatten.join(" ")
  end

end

