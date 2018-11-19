class Cutback::Router

  ACTIONS = %w[generate inspect]
  TYPES   = %w[manifest records archive metadata]

  @options              : Options
  @option_controller    : OptionController
  @generator_controller : GeneratorController
  @type                 : String?

  @action = "generate"

  def initialize(@options, @option_controller, @generator_controller)
  end

  def execute
    validate_options
    validate_arguments
    get_action
    get_type
    validate_action
    validate_type
    perform_action
  end

  protected def validate_options
    validate_help
    validate_version
    validate_config
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

  protected def validate_config
    @option_controller.update_from_config?
  end

  protected def validate_output
    raise Error::InvalidOutput.new if @options.output.nil?
  end

  protected def validate_paths
    raise Error::InvalidPaths.new if @options.paths.empty?
  end

  protected def validate_arguments
    raise Error::InvalidArguments.new if ARGV.size > 2
  end

  protected def validate_action
    pp @action
    raise Error::InvalidArguments.new unless ACTIONS.includes?(@action)
  end

  protected def validate_type
    raise Error::InvalidArguments.new unless TYPES.includes?(@type) || @type.nil?
  end

  protected def get_action
    @action = ARGV[0].strip.downcase if ARGV.size >= 1
  end

  protected def get_type
    @type = ARGV[1].strip.downcase if ARGV.size == 2
  end

  protected def perform_action
    case @action
    when "generate" then perform_generate
    when "inspect"  then perform_inspect
    end
  end

  protected def perform_generate
    case @type
    when nil        then @generator_controller.generate
    when "manifest" then @generator_controller.manifest
    when "records"  then @generator_controller.records
    when "archive"  then @generator_controller.archive
    when "metadata" then @generator_controller.metadata
    end
  end

  protected def perform_inspect
    # TODO
  end

end
