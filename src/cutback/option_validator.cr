class Cutback::OptionValidator

  def self.execute(options : Options)
    new(options).execute
  end

  def initialize(@options : Options)
  end

  def execute
    validate_help
    validate_version
    validate_output
    validate_paths
  end

  protected def validate_help
    return unless @options.help

    puts HELP
    exit
  end

  protected def validate_version
    return unless @options.version

    puts VERSION
    exit
  end

  protected def validate_output
    raise Error::InvalidOutput.new if @options.output.nil?
  end

  protected def validate_paths
    raise Error::InvalidPaths.new if @options.paths.empty?
  end

end

