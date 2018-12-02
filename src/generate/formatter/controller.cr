class Generate::Formatter::Controller < Generate::Formatter

  @controller : App::Controller

  def initialize(@controller)
  end

  def to_s(io)
    io << @controller.name.ljust(25)
    io << @controller.actions.map(&.name).join(" ")
  end

end

