class Cutback::Processor::Options < Cutback::Processor

  include Helpers::Options::Definitions

  @arguments : Array(String)
  @options   : Cutback::Options

  def initialize(@arguments, @options)
    @option_parser = OptionParser.new
    @prototype     = Cutback::Options::Prototype.new

    define_options
  end

  def process
    parse_options_into_prototype
    update_options_from_config
    update_options_from_prototype
    preprocess_options
  end

  protected def parse_options_into_prototype
    @option_parser.parse(@arguments)
  end

  protected def update_options_from_config
    return if @prototype.config.nil?

    config = Config.load(@prototype.config.not_nil!)

    @options.update(config)
  end

  protected def update_options_from_prototype
    @options.update(@prototype)
  end

  protected def preprocess_options
    @options.format   = @options.format.strip.downcase
    @options.progress = !@options.progress if @prototype.progress
    @options.compress = !@options.compress if @prototype.compress
  end

end

