# TODO: Merge into Action::Paths since it's only ever used there?
class Cutback::ArchiveSuffix

  # List of compressors with suffixes that are not identical to their command name
  TOOL_SUFFIXES = {
    "bzip2" => "bz2",
    "gzip"  => "gz",
    "lzip"  => "lz",
    "lzop"  => "lzo",
    "lrzip" => "lrz",
  }

  def self.for(tool)
    new.for(tool)
  end

  def for(tool) # TODO: BUG - Doesnt even work! Always uses xz for some reason
    suffix = TOOL_SUFFIXES[tool]? || tool

    ".#{suffix}"
  end

end

