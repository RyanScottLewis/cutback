class Generate::Formatter::Argument::UsageMan < Generate::Formatter

  @argument : App::Argument

  def initialize(@argument)
  end

  def to_s(io)
    io << "["
    io << @argument.name.upcase.to_roff.italic
    io << "]"
  end

end

