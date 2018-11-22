class Cutback::Metadata::Manifest < Cutback::Metadata::FileList

  def initialize(paths : PathList)
    super(paths.manifest)
  end

end

