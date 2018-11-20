class Cutback::Router

  @arguments            : Array(String)
  @generator_controller : GeneratorController

  def initialize(@arguments, @generator_controller)
  end

  def execute
    perform_action
  end

  protected def perform_action
    case @arguments[0]?
    when nil        then perform_generate
    when "generate" then perform_generate
    when "inspect"  then perform_inspect
    end
  end

  protected def perform_generate
    case @arguments[1]?
    when nil        then @generator_controller.generate
    when "manifest" then @generator_controller.manifest
    when "records"  then @generator_controller.records
    when "archive"  then @generator_controller.archive
    when "metadata" then @generator_controller.metadata
    end
  end

  protected def perform_inspect
    # TODO
  end

end
