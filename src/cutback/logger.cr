class Cutback::Logger

  FORMATTER = ::Logger::Formatter.new do |severity, datetime, _, message, io|
    label = severity.unknown? ? "ANY" : severity.to_s
    io << "[" << datetime << ", " << label.rjust(5) << "] "
    io << message
  end

  @loggers = {} of Symbol => ::Logger

  def initialize
    add_debug(:stdout, STDOUT)
    add_fatal(:stderr, STDERR)
  end

  delegate :[]=, to: @loggers

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

  def add(name, io, severity)
    @loggers[name] = ::Logger.new(io, severity, FORMATTER)
  end

  def add_debug(name, io)
    add(name, io, ::Logger::Severity::DEBUG)
  end

  def add_fatal(name, io)
    add(name, io, ::Logger::Severity::FATAL)
  end

end

