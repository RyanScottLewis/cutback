class Cutback::Validator::Options < Cutback::Validator

  FORMATS = %w[json yaml]

  @options : Cutback::Options

  def initialize(@options)
  end

  def validate
    validate_help
    validate_version
    validate_output
    validate_paths
    validate_format
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

  protected def validate_format
    raise Error::InvalidFormat.new unless FORMATS.includes?(@options.format)
  end

end

