class Cutback::Routes

  @options : Options
  @paths   : Paths

  getter manifest
  getter records
  getter archive
  getter metadata

  def initialize(@options, @paths)
    @manifest = Route::Manifest.new(@options, @paths)
    @records  = Route::Records.new(@options, @paths)
    @archive  = Route::Archive.new(@options, @paths)
    @metadata = Route::Metadata.new(@options, @paths)
  end

end

