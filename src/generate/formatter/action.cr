class Generate::Formatter::Action < Generate::Formatter

  @action : App::Action

  def initialize(@action)
  end

  def to_s(io)
    io << @action.name.ljust(23)
    io << @action.description
  end

end

