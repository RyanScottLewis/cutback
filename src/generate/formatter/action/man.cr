class Generate::Formatter::Action::Man < Generate::Formatter::Action

  def to_s(io)
    io << @action.name.ljust(23)
    io << @action.description
    io << "\n.br"
  end

end

