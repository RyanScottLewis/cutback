class Cutback::Processor::Options < Cutback::Processor::Base

  PATH_DELIMITER = ";"

  OPTIONS = {
    help:     {"-h", "--help"},
    version:  {"-v", "--version"},
    config:   {"-c", "--config VALUE"},
    output:   {"-o", "--output VALUE"},
    paths:    {"-p", "--paths VALUE"},
    excludes: {"-e", "--excludes VALUE"},
    records:  {"-r", "--records VALUE"},
    format:   {"-f", "--format VALUE"},
    compress: {"-C", "--compress"},
    progress: {"-P", "--progress"},
  }

  @arguments     : Array(String)
  @option_parser : OptionParser
  @options       : Cutback::Options
  @identifier    : Identifier
  @paths         : Paths

  def initialize(@arguments, @option_parser, @options, @identifier, @paths)
    define_options
  end

  def execute
    parse_options
    update_options_from_config
    preprocess_options
    validate_options
    update_identifier
    update_paths
  end

  protected def define_options # TODO: Macro for these.. use `value` for all then do parse_list on options after
    @option_parser.on( *OPTIONS[:help],     "" ) {         @options.help     = true }
    @option_parser.on( *OPTIONS[:version],  "" ) {         @options.version  = true }
    @option_parser.on( *OPTIONS[:config],   "" ) { |value| @options.config   = value }
    @option_parser.on( *OPTIONS[:output],   "" ) { |value| @options.output   = value }
    @option_parser.on( *OPTIONS[:paths],    "" ) { |value| @options.paths    = parse_list(value) }
    @option_parser.on( *OPTIONS[:excludes], "" ) { |value| @options.excludes = parse_list(value) }
    @option_parser.on( *OPTIONS[:records],  "" ) { |value| @options.records  = parse_list(value) }
    @option_parser.on( *OPTIONS[:format],   "" ) { |value| @options.format   = value }
    @option_parser.on( *OPTIONS[:compress], "" ) {         @options.compress = true }
    @option_parser.on( *OPTIONS[:progress], "" ) {         @options.progress = true }
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

  protected def validate_options
    Validator::Options.validate(@options)
  end

  protected def update_identifier
    @identifier.update(@options)
  end

  protected def update_paths
    @paths.update
  end

  protected def parse_list(value)
    value.split(/#{PATH_DELIMITER}+/)
  end

end

