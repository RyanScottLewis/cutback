class Cutback::Application

  def self.execute(arguments=ARGV)
    new(arguments).execute
  end

  def initialize(arguments=ARGV)
    @options              = Options.new
    @option_parser        = OptionParser.new
    @identifier           = Identifier.new(@options)
    @paths                = Paths.new(@options, @identifier)
    @routes               = Routes.new(@options, @paths)
    @option_controller    = OptionController.new(arguments, @option_parser, @options, @identifier, @paths)
    @argument_controller  = ArgumentController.new(arguments)
    @router               = Router.new(arguments, @routes)
  end

  def execute
    @option_controller.execute
    @argument_controller.execute
    @router.execute
  rescue error : Cutback::Error
    STDERR.puts "Error: #{error}"
    exit 1
  end

end

