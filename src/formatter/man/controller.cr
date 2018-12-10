class Cutback::Formatter::Man::Controller < Cutback::Formatter

  @controller : Definition::Controller

  def initialize(@controller)
  end

  def to_s(io)
    io << @controller.name.ljust(25).to_roff.italic
    io << @controller.description
    io << "\n.br\n"
    io << @controller.actions.join("\n.br\n")
    io << ".br\n"
  end

end

