class Cutback::Application

  def self.execute(*arguments)
    new(*arguments).execute
  end

  def initialize(@arguments : Array(String) = ARGV)
    @options    = Options.new
    @identifier = Identifier.new(@options)
    @paths      = Paths.new(@options, @identifier)
    @routes     = Routes.new(@options, @paths)
    @router     = Router.new(arguments, @routes)
  end

  def execute
    process_options
    process_arguments
    update_identifier
    update_paths
    execute_route
  rescue error : Cutback::Error
    display_error(error)
  end

  protected def process_options
    Processor::Options.process(@arguments, @options)
  end

  protected def process_arguments
    Processor::Arguments.process(@arguments)
  end

  protected def update_identifier
    @identifier.update(@options)
  end

  protected def update_paths
    @paths.update
  end

  protected def execute_route
    @router.execute
  end

  protected def display_error(error)
    STDERR.puts "Error: #{error}"

    exit 1
  end

end

