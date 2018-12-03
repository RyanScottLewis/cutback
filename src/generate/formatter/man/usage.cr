class Generate::Formatter::Man::Usage < Generate::Formatter

  @root : App::Root

  def initialize(@root)
  end

  def to_s(io)
    io << @root.name.to_roff.bold

    @root.arguments.each do |argument|
      io << " ["
      io << argument.name.upcase.to_roff.italic
      io << "]"
    end
  end

end

