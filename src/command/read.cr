class Cutback::Command::Read < Cutback::Command

  @path : String

  def initialize(@options, @paths, @tools, @logger, @path, @message=nil)
  end

  def generate
    append @tools.reader
    append formatted_path

    append_error
  end

  protected def formatted_path
    "'#{@path}'"
  end

end

