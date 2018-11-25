class Cutback::Processor::Options < Cutback::Processor::Base

  PATH_DELIMITER = ";"

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

  macro define_option(name, short, type)
    {% if type.id == "bool" %}
      @option_parser.on("-{{short}}", "--{{name}}", "")       {         @prototype.{{name.id}} = true }
    {% elsif type.id == "string" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = value }
    {% elsif type.id == "list" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = value.split(/#{PATH_DELIMITER}+/) }
    {% elsif type.id == "date" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = Time.parse_utc(value, "%F") } # TODO: Helper for this
    {% elsif type.id == "integer" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = value.to_i }
    {% end %}
  end

  protected def define_options
    define_option(help,     h, bool)
    define_option(version,  v, bool)
    define_option(config,   c, string)
    define_option(dry,      D, bool)
    define_option(output,   o, string)
    define_option(date,     d, date)
    define_option(index,    i, integer)
    define_option(paths,    p, list)
    define_option(excludes, e, list)
    define_option(records,  r, list)
    define_option(format,   f, string)
    define_option(compress, C, bool)
    define_option(progress, P, bool)
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

