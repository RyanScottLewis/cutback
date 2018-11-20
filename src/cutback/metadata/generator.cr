class Cutback::Metadata::Generator

  def self.create(*arguments)
    new(*arguments).create
  end

  @options : Options
  @paths   : Paths

  def initialize(@options, @paths)
  end

  def create
    create_metadata
  end

  protected def create_metadata
    backup   = create_backup_metadata
    manifest = create_file_list_metadata(@paths.manifest)
    records  = create_file_list_metadata(@paths.records)
    archive  = create_archive_metadata

    Metadata.new(backup, manifest, records, archive)
  end

  protected def create_backup_metadata
    Backup.new(@options.date, @options.paths)
  end

  protected def create_file_list_metadata(path)
    data  = File.read(path)
    count = data.count('\n')
    bytes = data.lines.sum { |path| File.size(path) }

    size = Size.new(bytes)

    FileList.new(count, size)
  end

  protected def create_archive_metadata
    compression = Archive::Compression.new(@options.toolchain.compress, @options.compress) # TODO: Option for compression enabled
    bytes       = File.size(@paths.archive)
    size        = Size.new(bytes)

    Archive.new(compression, size)
  end

end

