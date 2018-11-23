class Cutback::Command::Progress < Cutback::Command::Base

  @arguments = [] of String

  def initialize(@options, *arguments)
    arguments.each { |argument| @arguments << argument }
  end

  def to_s(io)
    join(io,
      @options.toolchain.pv,
      "-r", # Show current rate
      "-a", # Show average rate
      "-t", # Show timer
      @arguments
    )
  end

  def with_name(name)
    @arguments << "-N '#{name}'" # Show name

    self
  end

  def with_size(size)
    @arguments << "-s #{size}" # Total ize
    @arguments << "-e"         # Show ETA
    @arguments << "-p"         # Show progress bar

    self
  end

end

