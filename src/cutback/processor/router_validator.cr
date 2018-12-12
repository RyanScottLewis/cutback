class Cutback::Processor::RouterValidator < Cutback::Processor

  @router : Cutback::Router

  def initialize(@router)
  end

  def execute
    validate_controller
    validate_action
  end

  delegate controller, action, to: @router

  protected def validate_controller
    raise Error::InvalidController.new(controller) unless Controller.valid?(controller)
  end

  protected def validate_action
    controller_class = Controller[controller]?.not_nil!

    raise Error::InvalidAction.new(action) unless controller_class.action?(action)
  end

end

