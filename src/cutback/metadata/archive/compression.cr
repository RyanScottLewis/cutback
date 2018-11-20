class Cutback::Metadata::Archive::Compression

  Cutback.mapping({
    tool:    String,
    enabled: Bool,
    ratio:   Float64,
  })

  def initialize(@tool, @enabled, @ratio)
  end

end

