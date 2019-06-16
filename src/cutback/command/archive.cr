class Cutback::Command::Archive < Cutback::Command

  def generate
    append tools.archiver

    append "-c"                    # Create archive
    append "-f -"                  # Output to STDOUT
    append "-p"                    # Store all permissions
    append "--xattrs"              # Store all extended attributes
    append "-T #{paths.manifest}" # Read paths from file list

    append_error

    if options.progress
      if options.dry
        append_pipe progress
      else
        size = FileListCalculator.calculate(paths.manifest)

        append_pipe progress(size: size.bytes)
      end
    end

    append_pipe compress if options.compress

    append_output paths.archive
  end

end

