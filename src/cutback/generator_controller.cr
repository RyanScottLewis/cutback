class Cutback::GeneratorController

  @routes : Routes

  def initialize(@routes)
  end

  def generate
    manifest
    records
    archive
    metadata
  end

  def manifest
    @routes.manifest.execute
  end

  def records
    @routes.records.execute
  end

  def archive
    # TODO: 
    #@routes.archive.execute
  end

  def metadata
    @routes.metadata.execute
  end

end

