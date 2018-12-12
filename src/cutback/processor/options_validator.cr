class Cutback::Processor::OptionsValidator < Cutback::Processor

  FORMATS = %w[json yaml]

  @options : Cutback::Options

  def initialize(@options)
  end

  def execute
    validate_help
    validate_version
    validate_output
    validate_paths
    validate_format
  end

  # TODO: Should be in a before_action type of callback in a base controller
  protected def validate_help
    return unless @options.help

    puts Embed["help"]
    exit
  end

  # TODO: Should be in a before_action type of callback in a base controller
  protected def validate_version
    return unless @options.version

    puts Embed["version"]
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

