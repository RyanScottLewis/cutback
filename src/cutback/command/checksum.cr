class Cutback::Command::Checksum < Cutback::Command

  @check : Bool

  def initialize(@application, @message=nil, @check=false)
  end

  def generate
    if options.progress
      append progress(path: paths.archive)
      append_pipe
    end

    append tools.checker

    append "-b" unless @check # Read in binary mode
    append "-c", paths.checksum if @check

    append paths.archive unless options.progress

    append_output paths.checksum unless @check

    append_error
  end

end

