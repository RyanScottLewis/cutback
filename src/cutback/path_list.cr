class Cutback::PathList

  getter log      = ""
  getter manifest = ""
  getter records  = ""
  getter archive  = ""
  getter checksum = ""
  getter metadata = ""

  @options    : Options
  @tools      : ToolList
  @identifier : Identifier

  def initialize(@options, @tools, @identifier)
    update
  end

  def update
    tar_ext = ArchiveSuffix.for(@tools.compressor)

    @log      = File.join(@options.output, "#{@identifier}.log")
    @manifest = File.join(@options.output, "#{@identifier}.manifest")
    @records  = File.join(@options.output, "#{@identifier}.records")
    @archive  = File.join(@options.output, "#{@identifier}.tar.#{tar_ext}")
    @checksum = File.join(@options.output, "#{@identifier}.checksum")
    @metadata = File.join(@options.output, "#{@identifier}.#{@options.format}")
  end

end

