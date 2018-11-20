require "./search"

class Cutback::Command::Records < Cutback::Command::Search

  @options  : Options
  @paths    : Paths
  @progress : Progress

  def initialize(@options, @paths, @progress)
  end

  def to_s(io)
    find_files(io)
    show_progress?(io, "Generating records")
    output_to_file(io, @paths.records)
  end

  protected def find_files(io)
    io << [
      @options.toolchain.find,
      formatted_paths,
      "\\(",
      include_flags(@options.records),
      "\\)",
      "\\(",
      exclude_flags(@options.excludes),
      "\\)",
      "-type f",
    ].flatten.join(" ")
  end

end

