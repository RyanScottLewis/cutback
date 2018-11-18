class Cutback::Application

  def self.execute(arguments=ARGV)
    new(arguments).execute
  end

  def initialize(arguments=ARGV)
    @options              = Options.new
    @option_parser        = OptionParser.new
    @identifier           = Identifier.new(@options)
    @paths                = Paths.new(@options, @identifier)
    @commands             = Commands.new(@options, @paths)
    @option_controller    = OptionController.new(arguments, @option_parser, @options, @identifier, @paths)
    @generator_controller = GeneratorController.new(@options, @option_controller, @commands)
  end

  def execute
    @option_controller.execute
    @generator_controller.execute
  rescue error
    STDERR.puts "Error: #{error}"
    exit 1
  end

end

