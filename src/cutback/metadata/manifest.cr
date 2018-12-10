class Cutback::Metadata::Manifest < Cutback::Metadata::FileList

  def initialize(paths : List::Path)
    super(paths.manifest)
  end

end

