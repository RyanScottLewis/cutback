class Cutback::Router

  @arguments   : Array(String)
  @controllers : ControllerList

  property controller_name = "application"
  property action_name     = "create"

  def initialize(@arguments, @controllers)
  end

  def execute
    controller = @controllers[@controller_name]

    controller.execute(@action_name)
  end

end

