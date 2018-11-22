class Cutback::Route::Metadata < Cutback::Route::Base

  def initialize(@options, @paths)
  end

  def generate
    metadata = create_metadata

    metadata.save(@paths.metadata, @options.format)
  end

  def inspect
    metadata = create_metadata

    puts metadata.dump(@options.format)
  end

  protected def create_metadata
    Cutback::Metadata::Root.new(@options, @paths)
  end

end

