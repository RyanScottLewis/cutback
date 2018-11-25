class Cutback::Command::Progress < Cutback::Command::Base

  @name : String?
  @size : UInt64?
  @path : String?

  def initialize(@options, @paths, @tools, @logger, @name=nil, @size=nil, @path=nil)
  end

  def generate
    append @tools.viewer

    append "-r" # Show current rate
    append "-a" # Show average rate
    append "-t" # Show timer

    append "-N '#{@name}'" if @name # Show name

    if @size
      append "-s", @size # Total size
      append "-e"        # Show ETA
      append "-p"        # Show progress bar
    end

    append @path if @path
  end

end

