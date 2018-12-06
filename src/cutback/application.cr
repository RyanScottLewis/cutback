class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  def initialize(@arguments : Array(String) = ARGV)
    @logger      = Logger.new
    @options     = Options.new
    @identifier  = Identifier.new(@options)
    @tools       = ToolList.new
    @paths       = PathList.new(@options, @tools, @identifier)
    @controllers = ControllerList.new(@options, @paths, @tools, @identifier, @logger)
    @router      = Router.new(@arguments, @controllers, @logger)
  end

  def execute
    process_options
    process_arguments
    process_router

    validate_options
    validate_arguments
    validate_router

    update_identifier
    update_tools
    update_paths
    update_logger

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

  protected def process_router
    Processor::Router.process(@arguments, @router)
  end

  protected def validate_options
    Validator::Options.validate(@options)
  end

  protected def validate_arguments
    Validator::Arguments.validate(@arguments)
  end

  protected def validate_router
    Validator::Router.validate(@router)
  end

  protected def update_identifier
    @identifier.update(@options)
  end

  protected def update_paths
    @paths.update
  end

  protected def update_tools
    @tools.update(@options)
  end

  protected def update_logger
    @logger.io = File.open(@paths.log.to_s, "a+") unless @options.dry
  end

  protected def execute_route
    @router.execute
  end

  protected def display_error(error)
    message = "Error: #{error.class} - #{error}"

    STDERR.puts(message)
    @logger.error(message)

    exit 1
  end

end

