class Cutback::Paths < Cutback::List(Cutback::Path)

  @options    : Options
  @tools      : Tools
  @identifier : Identifier

  def initialize(@options, @tools, @identifier)
    update
  end

  def update(name, extname)
    @all[name] = Path.join(@options.output, "#{@identifier}.%s" % extname)
  end

  def update
    update("log",      "log")
    update("manifest", "manifest")
    update("records",  "records")
    update("archive",  "archive.#{archive_ext}")
    update("checksum", "checksum")
    update("metadata", "metadata.#{@options.format}")
    update("config",   "config.#{@options.format}")
  end

  key_delegate(log)
  key_delegate(manifest)
  key_delegate(records)
  key_delegate(archive)
  key_delegate(checksum)
  key_delegate(metadata)
  key_delegate(config)

  protected def archive_ext
    result = "tar"
    result += ArchiveSuffix.for(@tools.compressor) if @options.compress

    result.to_s
  end

end

