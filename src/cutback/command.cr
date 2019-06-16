abstract class Cutback::Command

  @application : Application
  @message     : String?

  @partials = [] of String

  def initialize(@application, @message=nil)
  end

  getter application

  delegate options, paths, tools, logger, message, to: application

  abstract def generate

  def to_s(io)
    generate

    data = @partials.to_a.flatten.compact.join(" ")
    @partials.clear

    io << data
  end

  def execute
    command = to_s

    logger.info("Command: #{command}")

    options.dry ? "" : `#{command}`
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

  protected def append_output(path)
    append ">", path.to_s
  end

  protected def append_output(type : self.class)
    append_output command(type)
  end

  protected def append_error
    append "2>>", paths.log
  end

  protected def progress(size=nil, path=nil)
    Progress.new(@application, @message, size, path.to_s)
  end

  protected def checksum(check=false)
    Checksum.new(@application, check)
  end

  protected def find(output=nil, includes=[] of String, excludes=[] of String)
    Find.new(@application, output, includes, excludes)
  end

  protected def compress
    Compress.new(@application)
  end

end

