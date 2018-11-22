class Cutback::Metadata::Records < Cutback::Metadata::FileList

  def initialize(paths : PathList)
    super(paths.records)
  end

end

