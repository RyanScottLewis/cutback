class Cutback::Processor::Arguments < Cutback::Processor

  @arguments : Array(String)

  def initialize(@arguments)
  end

  def execute
    preprocess_arguments
  end

  protected def preprocess_arguments
    @arguments.map! { |argument| argument.strip.downcase }
  end

end

