class Generate::Formatter::Man::Argument < Generate::Formatter

  @argument : Definition::Argument

  def initialize(@argument)
  end

  def to_s(io)
    io << @argument.name.ljust(25)
    io << @argument.description
    io << "\n.br"
  end

end

