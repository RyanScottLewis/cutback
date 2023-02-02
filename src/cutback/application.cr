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

    error.backtrace.each do |line|
      @logger.fatal("  #{line}")
    end

    exit 1
  end

  protected def execute_actions
    action options_parser             # TODO: parse_options
    # TODO: Option merging actions and such should be more explicit right here
    action options_operator           # TODO: operate_on_options
    action options_validator          # TODO: validate_options

    action arguments_preprocessor     # TODO: preprocess_arguments
    action arguments_validator        # TODO: validate_arguments

    action router_arguments_updater   # TODO: update_router_arguments
    action router_validator           # TODO: validate_router

    action identifier_options_updater # TODO: update_identifier_from_options
    action paths_options_updater      # TODO: update_paths_from_options
    action tools_options_updater      # TODO: update_tools_from_options
    action logger_output_updater      # TODO: update_logger_from_options

    action controller_factory         # TODO: initialize_controllers
  end

end

