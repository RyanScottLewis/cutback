class Cutback::Route::Metadata < Cutback::Route::Base

  def initialize(@options, @paths)
  end

  def generate
    metadata = create_metadata

    metadata.save(@paths.metadata, @options.format)
  end

  def inspect
  end

  protected def create_metadata
    Cutback::Metadata.create(@options, @paths)
  end

end

