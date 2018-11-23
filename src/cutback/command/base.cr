abstract class Cutback::Command::Base

  def self.execute(*arguments)
    new(*arguments).execute
  end

  @options : Options
  @paths   : PathList
  @logger  : Logger

  def initialize(@options, @paths, @logger)
  end

  abstract def to_s(io)

  def execute
    command = to_s

    @logger.info(command)

    @options.dry ? "" : `#{command}`
  end

  protected def pipe_to(io, command)
    io << " | "
    io << command
  end

  protected def output_to(io, path)
    io << " > "
    io << path
  end

  protected def error_to(io, path)
    io << " 2>> "
    io << path
  end

  protected def join(io, *partials)
    io << partials.to_a.flatten.compact.join(" ")
  end

  protected def progress(*arguments)
    Progress.new(@options, @paths, @logger, *arguments)
  end

end

