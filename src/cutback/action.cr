abstract class Cutback::Action

  def self.execute(*arguments) # TODO: Needed?
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
    logger.debug("Action: %s" % logger_scope)
  end

  protected def logger_scope
    self.class.name.
      gsub(/^Cutback::Action::/, ""). # TODO: Use self.class or something
      gsub(/([a-z])([A-Z])/, "\\1 \\2")
  end

end

