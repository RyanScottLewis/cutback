class Cutback::Metadata::Records < Cutback::Metadata::FileList

  def initialize(paths : List::Path)
    super(paths.records)
  end

end

