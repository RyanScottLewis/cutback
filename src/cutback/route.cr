abstract class Cutback::Route

  @options : Options

  def initialize(@options)
  end

  abstract def to_s(io)

  abstract def execute

end

