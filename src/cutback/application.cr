class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  @app : Definition::App

  def initialize(@arguments : Array(String) = ARGV)
    @app         = Definition::App.load # TODO: Needed? if so move to processor or someting =p
    @logger      = Logger.new
    @options     = Options.new
    @identifier  = Identifier.new
    @tools       = List::Tool.new
    @paths       = List::Path.new
    @controllers = List::Controller.new
    @router      = Router.new(@controllers, @logger)
  end

  def execute
    Processor::OptionsParser.execute!(@logger, @arguments, @options)
    Processor::OptionsValidator.execute!(@logger, @options)
    Processor::ArgumentsPreprocessor.execute!(@logger, @arguments)
    Processor::ArgumentsValidator.execute!(@logger, @arguments)
    Processor::RouterArgumentsUpdater.execute!(@logger, @arguments, @router)
    Processor::RouterValidator.execute!(@logger, @router)
    Processor::IdentifierOptionsUpdater.execute!(@logger, @identifier, @options)
    Processor::PathsOptionsUpdater.execute!(@logger, @paths, @tools, @identifier, @options)
    Processor::ToolsOptionsUpdater.execute!(@logger, @tools, @options)
    Processor::ControllerFactory.execute!(@logger, @app, @options, @identifier, @paths, @tools, @controllers, @router)
    Processor::LoggerOutputUpdater.execute!(@logger, @paths, @options)

    @router.execute
  rescue error : Cutback::Error
    display_error(error)
  end

  protected def display_error(error)
    @logger.fatal("Error: #{error.class} - #{error}")

    exit 1
  end

end

