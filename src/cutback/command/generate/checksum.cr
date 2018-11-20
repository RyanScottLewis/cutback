class Cutback::Command::Generate::Checksum < Cutback::Command::Generate

  def to_s(io)
    read_archive(io)

    pipe_to(io, @options.toolchain.checksum)

    error_to(io, @paths.log)

    output_to(io, @paths.checksum)
  end

  protected def read_archive(io)
    if @options.progress
      io << progress(@paths.archive)
    else
      join(io, "cat", @paths.archive)
    end
  end

end

