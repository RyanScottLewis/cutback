class Cutback::Command::Checksum < Cutback::Command::Base

  @check : Bool

  def initialize(@options, @paths, @tools, @logger, @message=nil, @check=false)
  end

  def generate
    if @options.progress
      append progress(path: @paths.archive)
      append_pipe
    end

    append @tools.checker

    append "-b" # Read in binary mode
    append "-c", @paths.checksum if @check

    append @paths.archive unless @options.progress

    append_output @paths.checksum unless @check

    append_error
  end

end

