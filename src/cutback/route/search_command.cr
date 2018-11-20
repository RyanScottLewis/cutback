require "./system_command"

abstract class Cutback::Route::SearchCommand < Cutback::Route::SystemCommand

  protected def formatted_paths
    @options.paths.map { |path| "'#{path}'" }
  end

  protected def exclude_flags(paths)
    paths.map { |path| "-not -path '#{path}'" }
  end

  protected def include_flags(paths)
    paths.map { |path| "-path '#{path}'" }.join(" -or ")
  end

end

