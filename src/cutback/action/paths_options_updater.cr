class Cutback::Action::PathsOptionsUpdater < Cutback::Action

  delegate paths, tools, identifier, options, to: application

  def execute
    update("log",      "log")
    update("manifest", "manifest")
    update("records",  "records")
    update("archive",  "archive.#{archive_ext}")
    update("checksum", "checksum")
    update("metadata", "metadata.#{options.format}")
    update("config",   "config.#{options.format}")
  end

  protected def update(name, extname)
    paths[name] = Path.join(options.output, "#{identifier}.%s" % extname)
  end

  protected def archive_ext
    result = "tar"
    result += ArchiveSuffix.for(tools.compressor) if options.compress # TODO: Just doesn't work. Might be a problem from config merging

    result.to_s
  end

end

