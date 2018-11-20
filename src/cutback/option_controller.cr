class Cutback::OptionController

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
  @options       : Options
  @identifier    : Identifier
  @paths         : Paths

  def initialize(@arguments, @option_parser, @options, @identifier, @paths)
    define_options
  end

  def execute
    parse_options
    update_from_config_option?
    preprocess_options
    validate_options
    update_identifier
  end

  protected def define_options
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

  protected def update_from_config_option?
    unless @options.config.nil?
      path = @options.config.not_nil!
      config_options = Options.load(path)

      @options.paths    = config_options.paths    if @options.paths.empty?
      @options.excludes = config_options.excludes if @options.excludes.empty?
      @options.records  = config_options.records  if @options.records.empty?
      @options.progress = config_options.progress if @options.progress.nil?
      @options.format   = config_options.format   if @options.format.nil?

      @options.progress ||= false
      @options.format   ||= "yaml"

      @paths.update
    end
  end

  protected def preprocess_options
    @options.format = @options.format.strip.downcase
  end

  protected def validate_options
    OptionValidator.execute(@options)
  end

  protected def update_identifier
    @identifier.update(@options)
  end

  protected def parse_list(value)
    value.split(/#{PATH_DELIMITER}+/)
  end

end

