class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  def initialize(@arguments : Array(String) = ARGV)
    @logger     = Logger.new(nil)
    @options    = Options.new
    @identifier = Identifier.new(@options)
    @tools      = ToolList.new
    @paths      = PathList.new(@options, @tools, @identifier)
    @routes     = RouteList.new(@options, @paths, @tools, @logger)
  end

  def execute
    process_options
    process_arguments
    validate_options
    validate_arguments
    update_identifier
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
    # TODO: I hate this fyi
    @options.index += 1 if @arguments.empty? || @arguments[0] == "generate"

    @identifier.update(@options)
  end

  protected def update_paths
    @paths.update
  end

  protected def setup_logger
    @logger.io = File.open(@paths.log, "a+")
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

