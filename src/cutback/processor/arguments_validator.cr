class Cutback::Processor::ArgumentsValidator < Cutback::Processor

  @arguments : Array(String)

  def initialize(@arguments)
  end

  def execute
    validate_size
  end

  protected def validate_size
    raise Error::InvalidArguments.new if @arguments.size > 2
  end

end

