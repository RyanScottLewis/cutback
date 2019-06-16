# Main point of entry and application Facade.
class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  @definition : Definition::Application

  def initialize(@arguments : Array(String) = ARGV)
    @definition  = Definition::Application.load
    @logger      = Logger.new
    @options     = Options.new
    @identifier  = Identifier.new
    @tools       = List::Tool.new
    @paths       = List::Path.new
    @controllers = List::Controller.new
    @router      = Router.new(@controllers, @logger)
  end

  macro action(name, *arguments)
    Action::{{name.id.camelcase}}.execute!(@logger, {{*arguments}})
  end

  def execute
    execute_actions

    @router.execute
  rescue error : Cutback::Error
    display_error(error)
  end

  protected def display_error(error)
    @logger.fatal("Error: #{error.class} - #{error}")

    exit 1
  end

  protected def execute_actions
    action(options_parser,             @arguments,  @options)
    action(options_operator,           @definition, @options)
    action(options_validator,          @options)
    action(arguments_preprocessor,     @arguments)
    action(arguments_validator,        @arguments)
    action(router_arguments_updater,   @arguments, @router)
    action(router_validator,           @router)
    action(identifier_options_updater, @identifier, @options)
    action(paths_options_updater,      @paths, @tools,   @identifier, @options)
    action(tools_options_updater,      @tools, @options)
    action(controller_factory,         @definition, @options, @identifier, @paths, @tools, @controllers, @router)
    action(logger_output_updater,      @paths, @options)
  end

end

