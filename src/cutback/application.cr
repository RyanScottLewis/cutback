class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  @app : Definition::App

  def initialize(arguments : Array(String) = ARGV)
    @app         = Definition::App.load # TODO: Needed?
    @arguments   = Arguments.new(arguments)
    @options     = Options.new(@arguments)
    @identifier  = Identifier.new(@options)
    @tools       = List::Tool.new(@options)
    @paths       = List::Path.new(@options, @tools, @identifier)
    @logger      = Logger.new(@options, @paths)
    @controllers = List::Controller.new(@app, @options, @paths, @tools, @identifier, @logger)
    @router      = Router.new(@arguments, @controllers, @logger)
  end

  def execute
    @logger.debug("Processor: Options")
    @options.process
    @logger.debug("Processor: Arguments")
    @arguments.process
    @logger.debug("Processor: Router")
    @router.process

    @logger.debug("Validator: Options")
    @options.validate
    @logger.debug("Validator: Arguments")
    @arguments.validate
    @logger.debug("Validator: Router")
    @router.validate

    @logger.debug("Update: Identifier")
    @identifier.update
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

