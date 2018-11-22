class Cutback::Application

  def self.execute(arguments=ARGV)
    new(arguments).execute
  end

  def initialize(arguments=ARGV)
    @options            = Options.new
    @option_parser      = OptionParser.new
    @identifier         = Identifier.new(@options)
    @paths              = Paths.new(@options, @identifier)
    @routes             = Routes.new(@options, @paths)
    @option_processor   = Processor::Options.new(arguments, @option_parser, @options, @identifier, @paths)
    @argument_processor = Processor::Arguments.new(arguments)
    @router             = Router.new(arguments, @routes)
  end

  def execute
    @option_processor.execute
    @argument_processor.execute
    @router.execute
  rescue error : Cutback::Error
    STDERR.puts "Error: #{error}"
    exit 1
  end

end

