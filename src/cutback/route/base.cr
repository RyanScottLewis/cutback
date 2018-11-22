abstract class Cutback::Route::Base

  @options : Options
  @paths   : PathList

  def initialize(@options, @paths)
  end

  abstract def generate

  abstract def inspect

end

