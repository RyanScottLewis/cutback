class Generate::Formatter::Man::Outline < Generate::Formatter::Help::Outline

  def to_s(io)
    io << String.build { |io| super(io) }.to_roff
  end

end

