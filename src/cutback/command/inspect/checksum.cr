class Cutback::Command::Inspect::Checksum < Cutback::Command::Inspect

  def to_s(io)
    read_archive(io)

    pipe_to(io, checksum)

    error_to(io, @paths.log)
  end

  protected def read_archive(io)
    if @options.progress
      io << progress(@paths.archive)
    else
      join(io, "cat", @paths.archive)
    end
  end

  protected def checksum
    String.build do |io|
      join(io,
        @options.toolchain.checksum,
        "-c", # Check the checksum
        @paths.checksum
      )
    end
  end

  protected def progress(*arguments)
    size = File.size(@paths.archive)

    super(*arguments).with_size(size)
  end

end

