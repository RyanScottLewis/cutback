class Generate::Formatter::Help::Argument < Generate::Formatter

  @argument : Definition::Argument

  def initialize(@argument)
  end

  def to_s(io)
    io << @argument.name.ljust(25)
    io << @argument.description
  end

end

