class Cutback::Action::ArgumentsPreprocessor < Cutback::Action

  delegate arguments, to: application

  def execute
    preprocess_arguments
  end

  protected def preprocess_arguments
    arguments.map!(&.strip.downcase)
  end

end

