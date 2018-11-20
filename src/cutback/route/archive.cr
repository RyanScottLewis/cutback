require "./system_command"

class Cutback::Route::Archive < Cutback::Route::SystemCommand

  @paths : Paths

  def initialize(@options, @paths, @progress)
  end

  def to_s(io)
    find_files(io)
    show_progress?(io, "Generating manifest")
    output_to_file(io, @paths.manifest)
  end

  protected def find_files(io)
    io << [
      @options.toolchain.find,
      formatted_paths,
      exclude_flags(@options.excludes),
      exclude_flags(@options.records),
      "-type f",
    ].flatten.join(" ")
  end

end

