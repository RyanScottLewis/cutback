class Cutback::Action::LoggerOutputUpdater < Cutback::Action

  delegate paths, options, to: application

  def execute
    # TODO: remove_stdout_logger unless options.verbose
    setup_file_logger unless options.dry
  end

  protected def setup_file_logger
    file = paths.log.open("a+")

    logger.add_debug(:file, file)
  end

end

