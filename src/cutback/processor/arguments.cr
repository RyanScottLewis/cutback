class Cutback::Processor::Arguments < Cutback::Processor::Base

  @arguments : Array(String)

  def initialize(@arguments)
  end

  def process
    preprocess_arguments
    validate_arguments
  end

  protected def preprocess_arguments
    @arguments.map! { |argument| argument.strip.downcase }
  end

  protected def validate_arguments
    Validator::Arguments.validate(@arguments)
  end

end

