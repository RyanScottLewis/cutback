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
    @router.execute
  rescue error : Cutback::Error
    STDERR.puts "Error: #{error}"
    exit 1
  end

  protected def process_options
    Processor::Options.process(@arguments, @options, @identifier, @paths)
  end

  protected def process_arguments
    Processor::Arguments.process(@arguments)
  end

end

