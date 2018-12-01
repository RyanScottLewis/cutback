class Generate::Formatter::Argument::Usage < Generate::Formatter

  @argument : App::Argument

  def initialize(@argument)
  end

  def to_s(io)
    io << "["
    io << @argument.name.upcase
    io << "]"
  end

end

