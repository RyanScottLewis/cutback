class Cutback::Command::Generate::Checksum < Cutback::Command::Generate

  def to_s(io)
    join(io,
      "cat",
      @paths.archive
    )

    # TODO:
    # -s  Size of tar
    # -e  Show ETA
    # -p  Show progress bar
    pipe_to(io, progress) if @options.progress

    pipe_to(io, checksum)

    error_to(io, @paths.log)

    output_to(io, @paths.checksum)
  end

  protected def checksum
    String.build do |io|
      join(io,
        @options.toolchain.checksum,
        "-" # Output to STDOUT
      )
    end
  end

end

