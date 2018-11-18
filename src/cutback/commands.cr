class Cutback::Commands

  def initialize(@options : Options, @paths : Paths)
    @progress = Command::Progress.new(@options)
    @manifest = Command::Manifest.new(@options, @paths, @progress)
    @records  = Command::Records.new(@options, @paths, @progress)
  end

  getter manifest
  getter records

end

