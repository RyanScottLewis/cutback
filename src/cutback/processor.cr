abstract class Cutback::Processor

  def self.execute(*arguments)
    new(*arguments).execute
  end

  def self.execute!(logger, *arguments)
    new(*arguments).execute!(logger)
  end

  abstract def execute

  def execute!(logger : Cutback::Logger)
    log_execution(logger)
    execute
  end

  protected def log_execution(logger)
    logger.debug("Processor: %s" % logger_scope)
  end

  protected def logger_scope
    self.class.name.
      gsub(/^Cutback::Processor::/, "").
      gsub(/([a-z])([A-Z])/, "\\1 \\2")
  end

end

