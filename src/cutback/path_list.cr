class Cutback::PathList

  @options    : Options
  @tools      : ToolList
  @identifier : Identifier

  @all = {} of String => String

  def initialize(@options, @tools, @identifier)
    update
  end

  getter all

  delegate :[], to: @all

  macro update_path(name, extname)
    @all[{{name.id.stringify}}] = File.join(@options.output, "#{@identifier}.%s" % {{extname}})
  end

  macro def_path(name)
    def {{name.id}}
      @all[{{name.id.stringify}}]
    end
  end

  def update
    update_path(log,      "log")
    update_path(manifest, "manifest")
    update_path(records,  "records")
    update_path(archive,  archive_ext)
    update_path(checksum, "checksum")
    update_path(metadata, "metadata.#{@options.format}")
  end

  def_path(log)
  def_path(manifest)
  def_path(records)
  def_path(archive)
  def_path(checksum)
  def_path(metadata)

  protected def archive_ext
    result = "tar"
    result += ArchiveSuffix.for(@tools.compressor) if @options.compress

    result.to_s
  end

end

