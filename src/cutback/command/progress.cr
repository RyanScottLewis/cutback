class Cutback::Command::Progress < Cutback::Command

  getter arguments : Array(String)

  def initialize(@options : Options)
    @arguments = %w[-r -a -t]
  end

  def to_s(io)
    io << [
      @options.toolchain.pv,
      @arguments
    ].flatten.join(" ")
  end

  def with_name(name)
    instance = Progress.new(@options)
    instance.arguments << "-N '#{name}'"

    instance
  end

end
