class Generate::Formatter::Outline::Man < Generate::Formatter::Outline

  def to_s(io)
    io << String.build { |io| super(io) }.to_roff
  end

end

