class Cutback::Formatter::Man::Outline < Cutback::Formatter::Help::Outline

  def to_s(io)
    io << String.build { |io| super(io) }.to_roff
  end

end

