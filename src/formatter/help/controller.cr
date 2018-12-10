class Generate::Formatter::Help::Controller < Generate::Formatter

  @controller : App::Controller

  def initialize(@controller)
  end

  def to_s(io)
    io << @controller.name.ljust(25)
    io << @controller.actions.join(" ")
  end

end

