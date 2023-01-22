class Cutback::Definition::Application < Cutback::Definition

  def self.load(path)
    from_yaml(File.read(path))
  end

  def self.load # TODO: Needed?
    from_yaml(Embed["app.yml"])
  end

  property name        : String
  property version     : String
  property homepage    : String
  property repository  : String
  property issues      : String
  property releases    : String
  property packages    : Hash(String, String)
  property license     : String
  property summary     : String
  property description : String
  property arguments   : Collection(Argument)
  property options     : Collection(Option)
  property controllers : Collection(Controller)

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

