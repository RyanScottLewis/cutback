abstract class Cutback::Route

  @options : Options
  @paths   : Paths

  def initialize(@options, @paths)
  end

  abstract def generate

  abstract def inspect

end

