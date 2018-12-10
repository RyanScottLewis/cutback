class Generate::App::Root < Generate::App

  mapping(
    name:        String,
    version:     String,
    homepage:    String,
    repository:  String,
    issues:      String,
    license:     String,
    summary:     String,
    description: String,
    strategy:    String,
    arguments:   Collection(Argument),
    options:     Collection(Option),
    controllers: Collection(Controller),
  )

  def for=(value)
    @for = value

    @arguments.for   = @for
    @options.for     = @for
    @controllers.for = @for

    @for
  end

  def outline
    case @for
    when :help then Formatter::Help::Outline.format(self)
    when :man  then Formatter::Man::Outline.format(self)
    else;           @name
    end
  end

  def usage
    case @for
    when :help then Formatter::Help::Usage.format(self)
    when :man  then Formatter::Man::Usage.format(self)
    else;           @name
    end
  end

end

