class Cutback::Action::ArgumentsPreprocessor < Cutback::Action

  @arguments : Array(String)

  def initialize(@arguments)
  end

  def execute
    preprocess_arguments
  end

  protected def preprocess_arguments
    @arguments.map!(&.strip.downcase)
  end

end

