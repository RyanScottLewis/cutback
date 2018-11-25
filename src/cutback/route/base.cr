abstract class Cutback::Route::Base

  @options : Options
  @paths   : PathList
  @tools   : ToolList
  @logger  : Logger

  def initialize(@options, @paths, @tools, @logger)
  end

  abstract def generate

  abstract def inspect

end

