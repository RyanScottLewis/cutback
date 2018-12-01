class Generate::App::Root < Generate::App

  YAML.mapping(
    name:        String,
    version:     String,
    homepage:    String,
    repository:  String,
    issues:      String,
    license:     String,
    summary:     String,
    description: String,
    strategy:    String,
    arguments:   Array(Argument),
    options:     Array(Option),
    controllers: Array(Controller),
  )

  def for=(value)
    @for = value

    @arguments.each   { |argument| argument.for = @for }
    @options.each     { |argument| argument.for = @for }
    @controllers.each { |argument| argument.for = @for }

    @for
  end

  def outline
    case @for
    when :man then Formatter::Outline::Man.format(self)
    else;          Formatter::Outline.format(self)
    end
  end

  def usage
    Formatter::Usage.format(self)
  end

end

