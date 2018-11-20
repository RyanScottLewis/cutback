abstract class Cutback::Command

  @options : Options

  def initialize(@options)
  end

  abstract def to_s(io)

  def execute
    command = to_s

    puts command

    `#{command}`
  end

end

