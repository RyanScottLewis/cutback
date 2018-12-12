class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  @app : Definition::App

  def initialize(arguments : Array(String) = ARGV)
    @app         = Definition::App.load # TODO: Needed? if so move to processor or someting =p
    @logger      = Logger.new
    @arguments   = Arguments.new(arguments)
    @options     = Options.new
    @identifier  = Identifier.new
    @tools       = List::Tool.new
    @paths       = List::Path.new
    @controllers = List::Controller.new
    @router      = Router.new(@controllers, @logger)
  end

  def execute
    Processor::Options.execute!(@logger, @arguments, @options)
    Validator::Options.execute!(@logger, @options)
    Processor::Arguments.execute!(@logger, @arguments)
    Validator::Arguments.execute!(@logger, @arguments)
    Processor::Router.execute!(@logger, @arguments, @router)
    Validator::Router.execute!(@logger, @router)
    Processor::Identifier.execute!(@logger, @identifier, @options)
    Processor::Paths.execute!(@logger, @paths, @tools, @identifier, @options)
    Processor::Tools.execute!(@logger, @tools, @options)
    Processor::Controllers.execute!(@logger, @app, @options, @identifier, @paths, @tools, @controllers, @router)
    Processor::Logger.execute!(@logger, @paths, @options)

    @router.execute
  rescue error : Cutback::Error
    display_error(error)
  end

  protected def display_error(error)
    @logger.fatal("Error: #{error.class} - #{error}")

    exit 1
  end

end

