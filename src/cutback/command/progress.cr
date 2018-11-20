class Cutback::Command::Progress < Cutback::Command

  @name : String?

  def initialize(@options, @name=nil)
  end

  def to_s(io)
    join(io,
      @options.toolchain.pv,
      "-r", # Show current rate
      "-a", # Show average rate
      "-t", # Show timer
      @name.nil? ? nil : "-N '#{@name}'" # Show name
    )
  end

end

