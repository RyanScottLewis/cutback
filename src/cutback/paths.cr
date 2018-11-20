class Cutback::Paths

  getter log      = ""
  getter manifest = ""
  getter records  = ""
  getter archive  = ""
  getter checksum = ""
  getter metadata = ""

  @options    : Options
  @identifier : Identifier

  def initialize(@options, @identifier)
    update
  end

  def update
    tar_ext = @options.toolchain.compress # TODO: Not really true since gzip will be gz
    output  = @options.output.not_nil!

    @log      = File.join(output, "#{@identifier}.log")
    @manifest = File.join(output, "#{@identifier}.manifest")
    @records  = File.join(output, "#{@identifier}.records")
    @archive  = File.join(output, "#{@identifier}.tar.#{tar_ext}")
    @checksum = File.join(output, "#{@identifier}.checksum")
    @metadata = File.join(output, "#{@identifier}.#{@options.format}")
  end

end

