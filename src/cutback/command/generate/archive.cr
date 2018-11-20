class Cutback::Command::Generate::Archive < Cutback::Command::Generate

  def to_s(io)
    join(io,
      @options.toolchain.tar,
      "-c",                   # Create archive
      "-f -",                 # Output to STDOUT
      "-p",                   # Store all permissions
      "--xattrs",             # Store all extended attributes
      "-T #{@paths.manifest}" # Read paths from file list
    )

    error_to(io, @paths.log)

    # TODO:
    # -s  Size of tar
    # -e  Show ETA
    # -p  Show progress bar
    pipe_to(io, progress) if @options.progress

    pipe_to(io, compress) if @options.compress

    output_to(io, @paths.archive)
  end

  protected def compress
    Compress.new(@options)
  end

end

