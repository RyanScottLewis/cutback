class Cutback::GeneratorController

  def initialize(@commands : Commands)
  end

  def generate
    manifest
    records
    archive
    metadata
  end

  def manifest
    @commands.manifest.execute
  end

  def records
    @commands.records.execute
  end

  def archive
  end

  def metadata
  end

end

