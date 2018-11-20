require "./system"

class Cutback::Command::Progress < Cutback::Command::System

  getter arguments : Array(String)

  @options : Options

  def initialize(@options)
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
