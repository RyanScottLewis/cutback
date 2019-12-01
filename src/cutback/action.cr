# Encapsulates a single action using SRP. Each class instance executes a single function which is
# logged to the application's logger. Subclass and define the `#execute` method.
abstract class Cutback::Action

  def self.execute(*arguments) # TODO: Needed?
    new(*arguments).execute
  end

  def self.execute!(*arguments)
    new(*arguments).execute!
  end

  @application : Application

  def initialize(@application)
  end

  getter application

  delegate logger, to: application

  abstract def execute

  def execute!
    log_execution
    execute
  end

  protected def log_execution
    logger.debug("Action: %s" % logger_scope)
  end

  protected def logger_scope
    self.class.name.
      gsub(/^Cutback::Action::/, ""). # TODO: Use self.class or something
      gsub(/([a-z])([A-Z])/, "\\1 \\2")
  end

end

