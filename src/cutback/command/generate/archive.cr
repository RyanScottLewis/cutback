class Cutback::Command::Generate::Archive < Cutback::Command::Generate

  def to_s(io)
    join(io,
      @options.toolchain.compress,
      "-c",                   # Create archive
      "-f -",                 # Output to STDOUT
      "-p",                   # Store all permissions
      "--xattrs",             # Store all extended attributes
      "-T #{@paths.manifest}" # Read paths from file list
    )

    pipe_to(io, progress) if @options.progress

    output_to(io, @paths.archive)
  end

end

