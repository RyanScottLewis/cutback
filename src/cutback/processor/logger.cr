class Cutback::Processor::Logger < Cutback::Processor

  def self.execute!(*arguments)
    new(*arguments).execute!
  end

  @logger  : Cutback::Logger
  @paths   : List::Path
  @options : Cutback::Options

  def initialize(@logger, @paths, @options)
  end

  def execute
    # TODO: remove_stdout_logger unless @options.verbose
    setup_file_logger unless @options.dry
  end

  def execute!
    super(@logger)
  end

  protected def setup_file_logger
    file = @paths.log.open("a+")

    @logger.add_debug(:file, file)
  end

end

