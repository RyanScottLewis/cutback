class Cutback::Processor::Router < Cutback::Processor

  @arguments : Array(String)
  @router    : Cutback::Router

  def initialize(@arguments, @router)
  end

  def process
    update_controller_name
    update_action_name
  end

  macro update_from_argument_at?(name, index)
    value = @arguments[{{index}}]?

    @router.{{name}} = value unless value.nil?
  end

  protected def update_controller_name
    update_from_argument_at?(controller_name, 1)
  end

  protected def update_action_name
    update_from_argument_at?(action_name, 0)
  end

end

