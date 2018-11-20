class Cutback::Metadata

  Cutback.mapping({
    backup:   { type: Backup },
    manifest: { type: FileList },
    records:  { type: FileList },
    archive:  { type: Archive },
  })

  def initialize(@backup, @manifest, @records, @archive)
  end

  def dump(format="yaml")
    case format
    when "yaml" then to_yaml
    when "json" then to_pretty_json
    else
      raise Error::InvalidFormat.new
    end
  end

end

