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
    @options.process
    @arguments.process
    @router.process

    @options.validate
    @arguments.validate
    @router.validate

    @identifier.update
    @paths.update
    @tools.update
    @logger.update

    @router.execute
  rescue error : Cutback::Error
    display_error(error)
  end

  protected def display_error(error)
    message = "Error: #{error.class} - #{error}"

    STDERR.puts(message)
    @logger.error(message)

    exit 1
  end

end

