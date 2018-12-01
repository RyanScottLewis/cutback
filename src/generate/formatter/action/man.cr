class Generate::Formatter::Action::Man < Generate::Formatter::Action

  def to_s(io)
    io << String.build { |io| super(io) }.to_roff
    io << "\n.br"
  end

end

