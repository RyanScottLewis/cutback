class Cutback::Command::Progress < Cutback::Command

  @name : String?

  def initialize(@options, @name=nil)
  end

  def to_s(io)
    join(io,
      @options.toolchain.pv,
      %w[-r -a -t],
      @name.nil? ? nil : "-N '#{@name}'"
    )
  end

end

