abstract class Cutback::Command::Base

  @options  : Options
  @paths    : PathList
  @tools    : ToolList
  @logger   : Logger

  @partials = [] of String

  def initialize(@options, @paths, @tools, @logger)
  end

  abstract def generate

  def to_s(io)
    generate

    data = @partials.to_a.flatten.compact.join(" ")
    @partials.clear

    io << data
  end

  def execute
    command = to_s

    @logger.info("Command: #{command}")

    @options.dry ? "" : `#{command}`
  end

  protected def append(value : String)
    @partials << value
  end

  protected def append(value : Array(String))
    @partials += value
  end

  protected def append(*partials)
    @partials += partials.to_a.map(&.to_s)
  end

  protected def append(value : self.class)
    append command(value)
  end

  protected def append(value : Command)
    append value.to_s
  end

  protected def append_pipe(command=nil)
    append "|"
    append command unless command.nil?
  end

  protected def append_pipe(type : self.class)
    append_pipe command(type)
  end

  protected def append_output(path : String)
    append ">", path
  end

  protected def append_output(type : self.class)
    append_output command(type)
  end

  protected def append_error
    append "2>>", @paths.log
  end

  protected def progress(name=nil, size=nil, path=nil)
    Progress.new(@options, @paths, @tools, @logger, name, size, path)
  end

  protected def checksum(check=false)
    Checksum.new(@options, @paths, @tools, @logger, check)
  end

  protected def find(output=nil, includes=[] of String, excludes=[] of String)
    Find.new(@options, @paths, @tools, @logger, output, includes, excludes)
  end

  protected def compress
    Compress.new(@options, @paths, @tools, @logger)
  end

end

