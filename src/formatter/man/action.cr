class Generate::Formatter::Man::Action < Generate::Formatter

  @action : Definition::Action

  def initialize(@action)
  end

  def to_s(io)
    io << @action.name.ljust(23).indent
    io << @action.description
    io << "\n.br"
  end

end

