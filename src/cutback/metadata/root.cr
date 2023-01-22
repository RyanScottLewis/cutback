class Cutback::Metadata::Root < Cutback::Metadata

  property backup   : Backup
  property manifest : Manifest
  property records  : Records
  property archive  : Archive

  def initialize(@backup, @manifest, @records, @archive)
  end

  def initialize(options : Cutback::Options, paths : List::Path, tools : List::Tool)
    @backup   = Backup.new(options)
    @manifest = Manifest.new(paths)
    @records  = Records.new(paths)
    @archive  = Archive.new(options, paths, tools, @manifest)
  end

end

