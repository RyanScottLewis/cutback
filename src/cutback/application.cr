# Main point of entry and application Facade.
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

  macro process(name, *arguments)
    Processor::{{name.id.camelcase}}.execute!(@logger, {{*arguments}})
  end

  def execute
    execute_processors

    @router.execute
  rescue error : Cutback::Error
    display_error(error)
  end

  protected def display_error(error)
    @logger.fatal("Error: #{error.class} - #{error}")

    exit 1
  end

  protected def execute_processors
    process(options_parser,             @arguments,  @options)
    process(options_operator,           @app, @options)
    process(options_validator,          @options)
    process(arguments_preprocessor,     @arguments)
    process(arguments_validator,        @arguments)
    process(router_arguments_updater,   @arguments, @router)
    process(router_validator,           @router)
    process(identifier_options_updater, @identifier, @options)
    process(paths_options_updater,      @paths, @tools,   @identifier, @options)
    process(tools_options_updater,      @tools, @options)
    process(controller_factory,         @app, @options, @identifier, @paths, @tools, @controllers, @router)
    process(logger_output_updater,      @paths, @options)
  end

end

