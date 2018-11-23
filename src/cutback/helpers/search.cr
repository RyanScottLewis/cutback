module Cutback::Helpers::Search

  protected def formatted_paths
    @options.paths.map { |path| "'#{path}'" }.join(" ")
  end

  protected def exclude_flags(paths)
    paths.map { |path| "-not -path '#{path}'" }.join(" ")
  end

  protected def include_flags(paths)
    paths.map { |path| "-path '#{path}'" }.join(" -or ")
  end

  protected def bracketed(flags)
    ["\\(", flags, "\\)"]
  end

  protected def find_files(io, *flags)
    join(io,
      @options.toolchain.find,
      formatted_paths,
      flags.to_a,
      "-type f",
    )
  end

end

