class Cutback::Logger < Logger

  FORMATTER = Formatter.new do |severity, datetime, progname, message, io|
    label = severity.unknown? ? "ANY" : severity.to_s
    io << "[" << datetime << ", " << label.rjust(5) << "] "
    io << message
  end

  property io

  def initialize
    super(STDOUT, Severity::DEBUG, FORMATTER)
  end

end

