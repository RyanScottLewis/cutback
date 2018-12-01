class Generate::Formatter::Controller::Man < Generate::Formatter::Controller

  def to_s(io)
    io << String.build { |io| super(io) }.to_roff
    io << "\n.br"
  end

end

