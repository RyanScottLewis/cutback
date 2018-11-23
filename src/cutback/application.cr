class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  def initialize(@arguments : Array(String) = ARGV)
    @logger     = Logger.new(STDOUT)
    @options    = Options.new
    @identifier = Identifier.new(@options)
    @paths      = PathList.new(@options, @identifier)
    @routes     = RouteList.new(@options, @paths, @logger)
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
    @identifier.update(@options)
  end

  protected def update_paths
    @paths.update
  end

  protected def setup_logger
    file = File.open(@paths.log, "a+")

    @logger.io = IO::MultiWriter.new(STDOUT, file) # TODO: This is totally borked as `@logger.io = file` works just fine
  end

  protected def execute_route
    Router.route(@arguments, @routes)
  end

  protected def display_error(error)
    STDERR.puts "Error: #{error.class} - #{error}"

    exit 1
  end

end

