class Cutback::Processor::Arguments < Cutback::Processor

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

