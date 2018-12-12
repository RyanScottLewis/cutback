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
    message = self.class.name.gsub(/^Cutback::/, "").gsub(/::/, ": ")

    logger.debug(message)

    execute
  end

end

