class Cutback::Processor::Paths < Cutback::Processor

  @paths      : List::Path
  @tools      : List::Tool
  @identifier : Cutback::Identifier
  @options    : Cutback::Options

  def initialize(@paths, @tools, @identifier, @options)
  end

  def execute
    update("log",      "log")
    update("manifest", "manifest")
    update("records",  "records")
    update("archive",  "archive.#{archive_ext}")
    update("checksum", "checksum")
    update("metadata", "metadata.#{@options.format}")
    update("config",   "config.#{@options.format}")
  end

  protected def update(name, extname)
    @paths[name] = Cutback::Path.join(@options.output, "#{@identifier}.%s" % extname)
  end

  protected def archive_ext
    result = "tar"
    result += ArchiveSuffix.for(@tools.compressor) if @options.compress

    result.to_s
  end

end

