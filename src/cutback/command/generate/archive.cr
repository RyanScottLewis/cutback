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

    pipe_to(io, progress) if @options.progress

    pipe_to(io, compress) if @options.compress

    output_to(io, @paths.archive)
  end

  protected def compress
    Compress.new(@options, @paths, @logger)
  end

  protected def progress(*arguments)
    manifest = Metadata::Manifest.new(@paths)
    size     = manifest.size.bytes

    super(*arguments).with_size(size)
  end

end

