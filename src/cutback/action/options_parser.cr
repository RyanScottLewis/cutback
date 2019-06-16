# TODO: Split into Action::Options::Parse and ::Update?
class Cutback::Action::OptionsParser < Cutback::Action

  include Helpers::Options::Definitions

  @arguments : Array(String)
  @options   : Options

  def initialize(@arguments, @options)
    @option_parser = OptionParser.new
    @prototype     = Options::Prototype.new

    define_options
  end

  def execute
    parse_options_into_prototype
    update_options_from_config
    update_options_from_prototype
    preprocess_options
  end

  protected def parse_options_into_prototype
    @option_parser.parse(@arguments)
  end

  protected def update_options_from_config
    path   = cli_config_path unless @prototype.config.nil?
    path   = search_config(path) if !path.nil? && path.directory?
    path ||= search_config(user_config_path)
    path ||= search_config(system_config_path)

    return if path.nil?

    config = Config.load(path.to_s)

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

  protected def cli_config_path
    Path.new(@prototype.config.not_nil!)
  end

  # TODO: use Definition::Application#name instead of `cutback`

  protected def user_config_path
    if ENV.has_key?("XDG_CONFIG_HOME")
      Path.join(ENV["XDG_CONFIG_HOME"], "cutback")
    else
      Path.join("~", ".config", "cutback").expand
    end
  end

  protected def system_config_path
    Path.join("/", "etc", "cutback")
  end

  protected def search_config(path)
    pattern = path.join("config.{yaml,yml,json,js}").to_s

    Dir[pattern].first?
  end

end

