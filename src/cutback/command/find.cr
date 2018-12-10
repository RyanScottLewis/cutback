class Cutback::Command::Find < Cutback::Command

  @output : String?

  def initialize(@options, @paths, @tools, @logger, @message=nil, @output=nil, @includes=[] of String, @excludes=[] of String)
  end

  def generate
    append @tools.finder

    append formatted_paths

    append include_flags unless @includes.empty?
    append exclude_flags unless @excludes.empty?

    append "-type f"

    append_error

    append_pipe progress if @options.progress

    append_output @output.not_nil! unless @output.nil?
  end

  protected def formatted_paths
    @options.paths.map { |path| "'#{path}'" }
  end

  protected def bracketed(flags)
    ["\\(", flags, "\\)"].flatten
  end

  protected def include_flags
    result = @includes.map { |path| "-path '#{path}'" }.join(" -or ")

    bracketed(result)
  end

  protected def exclude_flags
    excludes = @options.excludes + @excludes
    result   = excludes.map { |path| "-not -path '#{path}'" }

    bracketed(result)
  end

end

