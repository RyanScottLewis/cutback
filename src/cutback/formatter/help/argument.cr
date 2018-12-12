class Cutback::Formatter::Help::Argument < Cutback::Formatter

  @argument : Definition::Argument

  def initialize(@argument)
  end

  def to_s(io)
    io << @argument.name.ljust(31) # TODO: MAGIC NUMBER Get max length from somewhere
    io << @argument.description
  end

end

