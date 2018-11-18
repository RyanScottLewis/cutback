class Cutback::GeneratorController

  @options           : Options
  @option_controller : OptionController
  @commands          : Commands

  def initialize(@options, @option_controller, @commands)
  end

  def execute
    check_options
    generate_files
  end

  protected def check_options
    check_help
    check_version
    check_config
    check_output
    check_paths
  end

  protected def check_help
    return unless @options.help

    puts HELP
    exit
  end

  protected def check_version
    return unless @options.version

    puts VERSION
    exit
  end

  protected def check_config
    @option_controller.update_from_config?
  end

  protected def check_output
    raise Error::InvalidOutput.new if @options.output.nil?
  end

  protected def check_paths
    raise Error::InvalidPaths.new if @options.paths.empty?
  end

  protected def generate_files
    generate_manifest
    generate_records
    #generate_archive
    #generate_metadata
  end

  protected def generate_manifest
    @commands.manifest.execute
  end

  protected def generate_records
    @commands.records.execute
  end

end

