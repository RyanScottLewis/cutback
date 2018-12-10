class Cutback::Definition::Controller < Cutback::Definition

  mapping(
    name:        String,
    description: String,
    actions:     Array(Action),
  )

  formatters help, man

  def for=(value)
    @for = value

    @actions.each { |argument| argument.for = @for }

    @for
  end

end

