class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  def initialize(@arguments : Array(String) = ARGV)
    @logger      = Logger.new(STDOUT)
    @options     = Options.new
    @identifier  = Identifier.new(@options)
    @tools       = ToolList.new
    @paths       = PathList.new(@options, @tools, @identifier)
    @controllers = ControllerList.new(@options, @paths, @tools, @logger)
  end

  def execute
    process_options
    process_arguments
    validate_options
    validate_arguments
    update_identifier
    update_tools
    update_paths
    setup_logger
    execute_route
  rescue error : Cutback::Error
    display_error(error)
  end

  protected def process_options
    Processor::Options.process(@arguments, @options)
  end

  protected def process_arguments
    Processor::Arguments.process(@arguments)
  end

  protected def validate_arguments
    Validator::Arguments.validate(@arguments, @routes)
  end

  protected def validate_options
    Validator::Options.validate(@options)
  end

  protected def update_identifier
    @identifier.update(@options)

    # TODO: Better place for this
    @identifier.increment_largest(@options) if @options.index.nil? && (@arguments.empty? || @arguments[0] == "generate")
  end

  protected def update_paths
    @paths.update
  end

  protected def update_tools
    @tools.update(@options)
  end

  protected def setup_logger
    @logger.io = File.open(@paths.log, "a+") unless @options.dry
  end

  protected def execute_route
    Router.route(@arguments, @routes)
  end

  protected def display_error(error)
    message = "Error: #{error.class} - #{error}"

    STDERR.puts(message)
    @logger.error(message)

    exit 1
  end

end

