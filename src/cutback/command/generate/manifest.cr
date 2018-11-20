class Cutback::Command::Generate::Manifest < Cutback::Command::Generate

  include SearchHelpers

  def to_s(io)
    find_files(io,
      exclude_flags(@options.excludes),
      exclude_flags(@options.records)
    )

    pipe_to(io, progress) if @options.progress

    output_to(io, @paths.manifest)
  end

end

