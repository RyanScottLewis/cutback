class Cutback::GeneratorController

  @commands : Commands

  def initialize(@commands)
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

