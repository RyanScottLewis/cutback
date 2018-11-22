class Cutback::RouteList

  @options : Options
  @paths   : PathList

  getter manifest
  getter records
  getter archive
  getter checksum
  getter metadata

  def initialize(@options, @paths)
    @manifest = Route::Manifest.new(@options, @paths)
    @records  = Route::Records.new(@options, @paths)
    @archive  = Route::Archive.new(@options, @paths)
    @checksum = Route::Checksum.new(@options, @paths)
    @metadata = Route::Metadata.new(@options, @paths)
  end

end

