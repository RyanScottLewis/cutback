module Cutback::Helpers::Executable

  module ClassMethods

    def execute(*arguments)
      new(*arguments).execute
    end

    def execute!(logger, *arguments)
      new(*arguments).execute!(logger)
    end

  end

  macro included
    extend ClassMethods
  end

  abstract def execute

  def execute!(logger : Cutback::Logger)
    log_execution(logger)
    execute
  end

  protected def log_execution(logger)
    logger.debug("%s - %s" % [logger_scope, logger_message])
  end

  protected def logger_scope
    self.class.name.gsub(/^Cutback::/, "")
  end

  protected def logger_message
    "Execute"
  end

end

