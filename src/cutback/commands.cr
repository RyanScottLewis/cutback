class Cutback::Commands

  @options : Options
  @paths   : Paths

  def initialize(@options, @paths)
    @progress = Command::Progress.new(@options)
    @manifest = Command::Manifest.new(@options, @paths, @progress)
  end

  getter manifest
  getter records

end

