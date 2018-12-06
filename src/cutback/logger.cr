class Cutback::Logger

  FORMATTER = ::Logger::Formatter.new do |severity, datetime, progname, message, io|
    label = severity.unknown? ? "ANY" : severity.to_s
    io << "[" << datetime << ", " << label.rjust(5) << "] "
    io << message
  end

  @loggers = {} of Symbol => ::Logger
  @options : Options
  @paths   : PathList

  def initialize(@options, @paths)
    @loggers[:stdout] = ::Logger.new(STDOUT, ::Logger::Severity::DEBUG, FORMATTER)
    @loggers[:stderr] = ::Logger.new(STDERR, ::Logger::Severity::FATAL, FORMATTER)
  end

  def update
    file = @paths.log.open("a+")

    @loggers[:file] = ::Logger.new(file, ::Logger::Severity::DEBUG, FORMATTER)
  end

  macro def_severity(name)
    def {{name.id}}(message)
      log(::Logger::Severity::{{name.id.upcase}}, message)
    end
  end

  def_severity debug
  def_severity info
  def_severity warn
  def_severity error
  def_severity fatal
  def_severity unknown

  def log(severity, message)
    @loggers.values.each(&.log(severity, message))
  end

end

