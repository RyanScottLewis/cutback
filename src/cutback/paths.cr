class Cutback::Paths

  getter manifest = ""
  getter records  = ""
  getter archive  = ""
  getter metadata = ""

  def initialize(@options : Options, @identifier : Identifier)
    update
  end

  def update
    tar_ext = @options.toolchain.compress # TODO: Not really true since gzip will be gz
    output  = @options.output.not_nil!

    @manifest = File.join(output, "#{@identifier}.manifest")
    @records  = File.join(output, "#{@identifier}.records")
    @archive  = File.join(output, "#{@identifier}.tar.#{tar_ext}")
    @metadata = File.join(output, "#{@identifier}.#{@options.format}")
  end

end

