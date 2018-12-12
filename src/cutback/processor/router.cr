class Cutback::Processor::Router < Cutback::Processor

  @arguments : Array(String)
  @router    : Cutback::Router

  def initialize(@arguments, @router)
  end

  def execute
    if @arguments.size == 2
      @router.controller_name = @arguments[0]
      @router.action_name     = @arguments[1]
    elsif @arguments.size == 1
      @router.action_name     = @arguments[0]
    end
  end

end

