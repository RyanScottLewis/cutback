class Cutback::Formatter::Help::Usage < Cutback::Formatter

  @definition : Definition::Application

  def initialize(@definition)
  end

  def to_s(io)
    io << @definition.name

    @definition.arguments.each do |argument|
      io << " ["
      io << argument.name.upcase
      io << "]"
    end

    io << "\n".ljust(8)

    io << @definition.name

    [@definition.arguments[0], @definition.arguments[2]].each do |argument|
      io << " ["
      io << argument.name.upcase
      io << "]"
    end
  end

end

