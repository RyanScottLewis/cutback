class Cutback::Commands

  @options : Options
  @paths   : Paths

  getter manifest
  getter records
  getter metadata

  def initialize(@options, @paths)
    @progress = Command::Progress.new(@options)
    @manifest = Command::Manifest.new(@options, @paths, @progress)
    @records  = Command::Records.new(@options, @paths, @progress)
    @metadata = Command::Metadata.new(@options, @paths)
  end

end

