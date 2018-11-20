class Cutback::Command::Generate::Records < Cutback::Command::Generate

  include SearchHelpers

  def initialize(@options, @paths)
  end

  def to_s(io)
    find_files(io,
      bracketed(include_flags(@options.records)),
      bracketed(exclude_flags(@options.excludes)),
    )

    pipe_to(io, progress("Generating Records")) if @options.progress

    output_to(io, @paths.records)
  end

end

