class Cutback::Validator::Router < Cutback::Validator

  @router : Cutback::Router

  def initialize(@router)
  end

  def execute
    validate_controller
    validate_action
  end

  delegate controller_name, action_name, to: @router

  protected def validate_controller
    raise Error::InvalidController.new(controller_name) unless Controller.valid?(controller_name)
  end

  protected def validate_action
    controller_class = Controller[controller_name]?.not_nil!

    raise Error::InvalidAction.new(action_name) unless controller_class.action?(action_name)
  end

end

