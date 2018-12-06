class Cutback::Router

  @arguments   : Array(String)
  @controllers : Controllers
  @logger      : Logger

  property controller_name = "proxy"
  property action_name     = "create"

  def initialize(@arguments, @controllers, @logger)
  end

  def execute
    @logger.debug("Router: Calling #{@controller_name}##{@action_name}")
    @controllers[@controller_name].execute(@action_name)
  end

  def process
    Processor::Router.process(@arguments, self)
  end

  def validate
    Validator::Router.validate(self)
  end

end

