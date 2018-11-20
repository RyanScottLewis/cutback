class Cutback::ArgumentValidator

  ACTIONS = %w[generate inspect]
  TYPES   = %w[manifest records archive checksum metadata]

  def self.execute(arguments : Array(String))
    new(arguments).execute
  end

  @arguments : Array(String)

  def initialize(@arguments)
  end

  def execute
    validate_size
    validate_action
    validate_type
  end

  protected def validate_size
    raise Error::InvalidArguments.new if @arguments.size > 2
  end

  protected def validate_action
    action = @arguments[0]?

    raise Error::InvalidArguments.new unless ACTIONS.includes?(action) || action.nil?
  end

  protected def validate_type
    type = @arguments[1]?

    raise Error::InvalidArguments.new unless TYPES.includes?(type) || type.nil?
  end

end

