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

  getter arguments
  getter definition
  getter logger
  getter options
  getter identifier
  getter tools
  getter paths
  getter controllers
  getter router

  macro action(name)
    Action::{{name.id.camelcase}}.execute!(self)
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
    action options_parser
    action options_operator
    action options_validator
    action arguments_preprocessor
    action arguments_validator
    action router_arguments_updater
    action router_validator
    action identifier_options_updater
    action paths_options_updater
    action tools_options_updater
    action controller_factory
    action logger_output_updater
  end

end

