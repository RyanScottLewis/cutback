class Cutback::Route::Progress < Cutback::Route::SystemCommand

  getter arguments : Array(String)

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
    instance = self.class.new(@options)
    instance.arguments << "-N '#{name}'"

    instance
  end

end
