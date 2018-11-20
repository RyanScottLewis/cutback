abstract class Cutback::Route::SystemCommand < Cutback::Route

  @progress : Progress

  def initialize(@options)
    @progress = Progress.new(@options)
  end

  def initialize(@options, @progress)
  end

  def execute
    command = to_s

    puts command # TODO: Verbose

    `#{command}`
  end

  protected def show_progress?(io, name)
    return unless @options.progress

    io << " | "
    io << @progress.with_name(name)
  end

  protected def output_to_file(io, path)
    io << " > "
    io << path
  end

end

