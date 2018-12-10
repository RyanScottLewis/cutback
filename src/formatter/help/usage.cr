class Generate::Formatter::Help::Usage < Generate::Formatter

  @root : App::Root

  def initialize(@root)
  end

  def to_s(io)
    io << @root.name

    @root.arguments.each do |argument|
      io << " ["
      io << argument.name.upcase
      io << "]"
    end

    io << "\n".ljust(8)

    io << @root.name

    [@root.arguments[0], @root.arguments[2]].each do |argument|
      io << " ["
      io << argument.name.upcase
      io << "]"
    end
  end

end

