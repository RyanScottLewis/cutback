class Cutback::Metadata::Records < Cutback::Metadata::FileList

  def initialize(paths : Paths)
    super(paths.records)
  end

end

