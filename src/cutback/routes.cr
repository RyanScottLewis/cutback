class Cutback::Routes

  @options : Options
  @paths   : Paths

  getter manifest
  getter records
  getter archive
  getter metadata

  def initialize(@options, @paths)
    @progress = Route::Progress.new(@options)
    @manifest = Route::Manifest.new(@options, @paths, @progress)
    @records  = Route::Records.new(@options, @paths, @progress)
    @archive  = Route::Archive.new(@options, @paths, @progress)
    @metadata = Route::Metadata.new(@options, @paths)
  end

end

