abstract class Cutback::Command::Search < Cutback::Command

  protected def formatted_paths
    @options.paths.map { |path| "'#{path}'" }
  end

  protected def exclude_flags(paths)
    paths.map { |path| "-not -path '#{path}'" }
  end

  protected def include_flags(paths)
    paths.map { |path| "-path '#{path}'" }.join(" -or ")
  end

  protected def show_progress?(io, name)
    return unless @options.progress

    io << " | "
    io << @progress.with_name(name)
  end

  protected def output_to_file(io, path)
    io << " > "
    io << path
  end

end

