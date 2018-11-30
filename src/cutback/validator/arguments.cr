class Cutback::Validator::Arguments < Cutback::Validator

  @arguments : Array(String)

  def initialize(@arguments)
  end

  def validate
    validate_size
  end

  protected def validate_size
    raise Error::InvalidArguments.new if @arguments.size > 2
  end

end

