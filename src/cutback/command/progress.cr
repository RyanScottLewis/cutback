class Cutback::Command::Progress < Cutback::Command::Base

  @name : String?
  @size : UInt64?
  @path : String?

  def initialize(@options, @paths, @tools, @logger, @message=nil, @size=nil, @path=nil)
  end

  def execute
    @logger.info(@message) if @message

    super
  end

  def generate
    append @tools.viewer

    append "-r" # Show current rate
    append "-a" # Show average rate
    append "-t" # Show timer

    append "-N '#{@message.to_s.ljust(20)}'" if @message # Show name

    if @size
      append "-s", @size # Total size
      append "-e"        # Show ETA
      append "-p"        # Show progress bar
    end

    append @path if @path
  end

end

