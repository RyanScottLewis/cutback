class Cutback::Action::OptionsValidator < Cutback::Action

  FORMATS = %w[json yaml]

  @options : Options

  def initialize(@options)
  end

  def execute
    validate_output
    validate_paths
    validate_format
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

