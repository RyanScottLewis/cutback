class Cutback::ArgumentController

  @arguments : Array(String)

  def initialize(@arguments)
  end

  def execute
    preprocess_arguments
    validate_arguments
  end

  protected def preprocess_arguments
    @arguments.map! { |argument| argument.strip.downcase }
  end

  protected def validate_arguments
    ArgumentValidator.execute(@arguments)
  end

end

