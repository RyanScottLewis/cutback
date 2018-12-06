class Cutback::Logger < Logger

  FORMATTER = Formatter.new do |severity, datetime, progname, message, io|
    label = severity.unknown? ? "ANY" : severity.to_s
    io << "[" << datetime << ", " << label.rjust(5) << "] "
    io << message
  end

  @options : Options
  @paths   : PathList

  def initialize(@options, @paths)
    super(STDOUT, Severity::DEBUG, FORMATTER)
  end

  # TODO: BROKEN! And let me explain how...
  #
  #   @io = file                              # Works fine
  #   @io = STDOUT                            # Works fine
  #   @io = IO::MultiWriter.new(STDOUT, file) # Broken
  #
  # And it is definitely somehow maybe MultiWriter's fault
  def update
    file = @paths.log.open("a+")
    @io  = IO::MultiWriter.new(STDOUT, file)
  end

end

