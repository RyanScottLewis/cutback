class Cutback::Validator::Arguments < Cutback::Validator::Base

  ACTIONS = %w[generate inspect]
  TYPES   = %w[manifest records archive checksum metadata]

  @arguments : Array(String)
  @routes    : RouteList

  def initialize(@arguments, @routes)
  end

  def validate
    validate_size
    validate_action
    validate_type
  end

  protected def validate_size
    raise Error::InvalidArguments.new if @arguments.size > 2
  end

  protected def validate_action
    action = @arguments[0]?

    raise Error::InvalidAction.new unless ACTIONS.includes?(action) || action.nil?
  end

  protected def validate_type
    type = @arguments[1]?

    raise Error::InvalidType.new unless @routes.valid?(type) || type.nil?
  end

end

