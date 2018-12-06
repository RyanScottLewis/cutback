class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  def initialize(arguments : Array(String) = ARGV)
    @arguments   = Arguments.new(arguments)
    @options     = Options.new(@arguments)
    @identifier  = Identifier.new(@options)
    @tools       = ToolList.new(@options)
    @paths       = PathList.new(@options, @tools, @identifier)
    @logger      = Logger.new(@options, @paths)
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
    @options.process
  end

  protected def process_arguments
    @arguments.process
  end

  protected def process_router
    @router.process
  end

  protected def validate_options
    @options.validate
  end

  protected def validate_arguments
    @arguments.validate
  end

  protected def validate_router
    @router.validate
  end

  protected def update_identifier
    @identifier.update
  end

  protected def update_paths
    @paths.update
  end

  protected def update_tools
    @tools.update
  end

  protected def update_logger
    @logger.update
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

