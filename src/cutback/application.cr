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

  macro method_missing(call)
    process({{call.name}}, {{*call.args}})
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
    options_parser(@arguments, @options)
    options_validator(@options)
    arguments_preprocessor(@arguments)
    arguments_validator(@arguments)
    router_arguments_updater(@arguments, @router)
    router_validator(@router)
    identifier_options_updater(@identifier, @options)
    paths_options_updater(@paths, @tools, @identifier, @options)
    tools_options_updater(@tools, @options)
    controller_factory(@app, @options, @identifier, @paths, @tools, @controllers, @router)
    logger_output_updater(@paths, @options)
  end

end

