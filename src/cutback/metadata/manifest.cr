class Cutback::Metadata::Manifest < Cutback::Metadata::FileList

  def initialize(paths : Paths)
    super(paths.manifest)
  end

end

