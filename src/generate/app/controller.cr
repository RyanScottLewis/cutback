class Generate::App::Controller < Generate::App

  YAML.mapping(
    name:        String,
    description: String,
    actions:     Array(Action),
  )
  def for=(value)
    @for = value
    @actions.each { |argument| argument.for = @for }

    @for
  end

  def to_s(io)
    io << case @for
    when :man       then Formatter::Controller::Man.format(self)
    else;                Formatter::Controller.format(self)
    end
  end

end

