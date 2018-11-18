abstract class Cutback::Command

  def initialize(@options : Options)
  end

  abstract def to_s(io)

  def execute
    command = to_s

    puts command

    `#{command}`
  end

end

