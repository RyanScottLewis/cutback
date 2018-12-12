class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  @app : Definition::App

  def initialize(arguments : Array(String) = ARGV)
    @app         = Definition::App.load # TODO: Needed?
    @arguments   = Arguments.new(arguments)
    @options     = Options.new
    @identifier  = Identifier.new
    @tools       = List::Tool.new(@options)
    @paths       = List::Path.new(@options, @tools, @identifier)
    @logger      = Logger.new(@options, @paths)
    @controllers = List::Controller.new(@app, @options, @paths, @tools, @identifier, @logger)
    @router      = Router.new(@controllers, @logger)
  end

  def execute
    Processor::Options.execute!(@logger, @arguments, @options)
    Processor::Arguments.execute!(@logger, @arguments)
    Processor::Router.execute!(@logger, @arguments, @router)

    Validator::Options.execute!(@logger, @options)
    Validator::Arguments.execute!(@logger, @arguments)
    Validator::Router.execute!(@logger, @router)

    Processor::Identifier.execute!(@logger, @identifier, @options)
    @logger.debug("Update: Paths")
    @paths.update
    @logger.debug("Update: Tools")
    @tools.update
    @logger.debug("Update: Logger")
    @logger.update

    @logger.debug("Router: Execute")
    @router.execute
  rescue error : Cutback::Error
    display_error(error)
  end

  protected def display_error(error)
    @logger.fatal("Error: #{error.class} - #{error}")

    exit 1
  end

end

