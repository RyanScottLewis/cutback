class Cutback::Command::Generate::Records < Cutback::Command::Generate

  include Helpers::Search

  def to_s(io)
    find_files(io,
      bracketed(include_flags(@options.records)),
      bracketed(exclude_flags(@options.excludes)),
    )

    error_to(io, @paths.log)

    pipe_to(io, progress) if @options.progress

    output_to(io, @paths.records)
  end

end

