abstract class Cutback::Command::System < Cutback::Command

  def execute
    command = to_s

    puts command # TODO: Verbose

    `#{command}`
  end

end

