class Cutback::Action::ArgumentsValidator < Cutback::Action

  delegate arguments, to: application

  def execute
    validate_size
  end

  protected def validate_size
    raise Error::InvalidArguments.new if arguments.size > 2
  end

end

