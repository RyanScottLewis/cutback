class Generate::Formatter::Help::Action < Generate::Formatter

  @action : Definition::Action

  def initialize(@action)
  end

  def to_s(io)
    io << @action.name
  end

end

