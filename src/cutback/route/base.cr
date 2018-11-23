abstract class Cutback::Route::Base

  @options : Options
  @paths   : PathList
  @logger  : Logger

  def initialize(@options, @paths, @logger)
  end

  abstract def generate

  abstract def inspect

  macro execute_generate(command)
    @logger.info("Generating {{command}}")
    Command::Generate::{{command.id.capitalize}}.execute(@options, @paths, @logger)
  end

end

