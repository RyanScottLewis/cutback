require "./search"

class Cutback::Command::GenerateManifest < Cutback::Command::Search

  @options : Options
  @paths   : Paths

  def initialize(@options, @paths)
  end

  def to_s(io)
    find_files(io,
      exclude_flags(@options.excludes),
      exclude_flags(@options.records)
    )

    pipe_to(io, progress("Generating Manifest")) if @options.progress

    output_to(io, @paths.manifest)
  end

end

