class Generate::Formatter::Controller::Man < Generate::Formatter::Controller

  def to_s(io)
    io << @controller.name.ljust(25)
    io << @controller.description
    io << "\n.br"
  end

end

