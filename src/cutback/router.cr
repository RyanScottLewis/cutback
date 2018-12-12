class Cutback::Router

  @controllers : List::Controller
  @logger      : Cutback::Logger

  property controller = "proxy"
  property action     = "create"

  def initialize(@controllers, @logger)
  end

  def execute
    execute_controller_action
  end

  def call(controller, action)
    @controller = controller
    @action     = action

    execute_controller_action
  end

  protected def execute_controller_action
    @logger.debug("Router: Calling #{@controller}##{@action}")
    @controllers[@controller].execute(@action)
  end

end

