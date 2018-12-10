class Cutback::Metadata::Root < Cutback::Metadata

  mapping(
    backup:   { type: Backup },
    manifest: { type: Manifest },
    records:  { type: Records },
    archive:  { type: Archive },
  )

  def initialize(@backup, @manifest, @records, @archive)
  end

  def initialize(options : Options, paths : List::Path, tools : List::Tool)
    @backup   = Backup.new(options)
    @manifest = Manifest.new(paths)
    @records  = Records.new(paths)
    @archive  = Archive.new(options, paths, tools, @manifest)
  end

end

