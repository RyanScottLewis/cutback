class Cutback::Command::Metadata < Cutback::Command

  @paths : Paths

  def initialize(@options, @paths)
  end

  def to_s(io)
    backup         = Cutback::Metadata::Backup.new(@options.date, @options.paths)
    manifest       = file_list_metadata(@paths.manifest)
    records        = file_list_metadata(@paths.records)
    compression    = Cutback::Metadata::Archive::Compression.new(@options.toolchain.compress, true) # TODO: Option for compression enabled
    checksum       = Cutback::Metadata::Archive::Checksum.new(@options.toolchain.sum, "I am a checksum") # TODO: Generate checksum
    archive        = Cutback::Metadata::Archive.new(compression, checksum)
    metadata       = Cutback::Metadata.new(backup, manifest, records, archive)

    io << metadata.dump(@options.format)
  end

  def execute
    # TODO: Check if manifest exists, if not create it
    # TODO: Check if records exists, if not create it
    # TODO: Check if archive exists, if not create it
    write_file
  end

  protected def write_file
    File.write(@paths.metadata, to_s)
  end

  protected def file_list_metadata(path)
    data  = File.read(path)
    count = data.count('\n')
    bytes = data.lines.sum { |path| File.size(path) }
    human = FileSize.convert(bytes)

    size = Cutback::Metadata::FileList::Size.new(bytes, human)

    Cutback::Metadata::FileList.new(count, size)
  end

  protected def archive_metadata(compression, checksum)
    archive = Cutback::Metadata::Archive.new(compression, checksum)
  end

end

