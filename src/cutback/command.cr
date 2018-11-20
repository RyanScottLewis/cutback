abstract class Cutback::Command

  def self.execute(*arguments)
    new(*arguments).execute
  end

  @options : Options

  def initialize(@options)
  end

  abstract def to_s(io)

  def execute
    command = to_s

    puts command # TODO: Verbose option

    `#{command}`
  end

  protected def pipe_to(io, command)
    io << " | "
    io << command
  end

  protected def output_to(io, path)
    io << " > "
    io << path
  end

  protected def join(io, *partials)
    io << partials.to_a.flatten.compact.join(" ")
  end

  protected def progress(name=nil)
    Progress.new(@options, name)
  end

end

