class Generate::Formatter::Man::Option < Generate::Formatter::Help::Option

  def to_s(io)
    io << String.build { |io| super(io) }.to_roff
    io << "\n.br"
  end

end

