class Cutback::Definition::Controller < Cutback::Definition

  property name        : String
  property description : String
  property actions     : Array(Action)

  formatters help, man

  def for=(value)
    @for = value

    @actions.each { |argument| argument.for = @for }

    @for
  end

end

