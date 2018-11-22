class Cutback::Processor::Options < Cutback::Processor::Base

  PATH_DELIMITER = ";"

  @arguments     : Array(String)
  @options       : Cutback::Options
  @option_parser : OptionParser

  def initialize(@arguments, @options)
    @option_parser = OptionParser.new

    define_options
  end

  def process
    parse_options
    update_options_from_config
    preprocess_options
  end

  macro define_option(name, short, type)
    {% if type.id == "bool" %}
      @option_parser.on("-{{short}}", "--{{name}}", "") { @options.{{name.id}} = true }
    {% elsif type.id == "string" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @options.{{name.id}} = value }
    {% elsif type.id == "list" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @options.{{name.id}} = parse_list(value) }
    {% end %}
  end

  protected def define_options # TODO: Macro for these.. use `value` for all then do parse_list on options after
    define_option(help,     h, bool)
    define_option(version,  v, bool)
    define_option(config,   c, string)
    define_option(output,   o, string)
    define_option(paths,    p, list)
    define_option(excludes, e, list)
    define_option(records,  r, list)
    define_option(format,   f, string)
    define_option(compress, C, bool)
    define_option(progress, P, bool)
  end

  protected def parse_options
    @option_parser.parse(@arguments)
  end

  protected def update_options_from_config
    return if @options.config.nil?

    config = Config.load(@options.config.not_nil!)

    config.update_options(@options)
  end

  protected def preprocess_options
    @options.format = @options.format.strip.downcase
  end

  protected def parse_list(value)
    value.split(/#{PATH_DELIMITER}+/)
  end

end

