class Cutback::Router

  @arguments   : Array(String)
  @controllers : ControllerList

  property controller_name = "backup"
  property action_name     = "create"

  def initialize(@arguments, @controllers)
  end

  def execute
    @controllers[@controller_name].execute(@action_name)
  end

end

