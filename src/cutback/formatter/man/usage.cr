class Cutback::Formatter::Man::Usage < Cutback::Formatter

  @definition : Definition::Application

  def initialize(@definition)
  end

  def to_s(io)
    io << @definition.name.to_roff.bold

    @definition.arguments.each do |argument|
      io << " ["
      io << argument.name.upcase.to_roff.italic
      io << "]"
    end

    io << "\n.br\n"

    io << @definition.name.to_roff.bold

    [@definition.arguments[0], @definition.arguments[2]].each do |argument|
      io << " ["
      io << argument.name.upcase.to_roff.italic
      io << "]"
    end
  end

end

