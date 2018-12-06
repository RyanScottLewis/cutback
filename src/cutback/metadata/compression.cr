class Cutback::Metadata::Compression < Cutback::Metadata

  mapping(
    tool:    String,
    enabled: Bool,
    ratio:   Float64,
  )

  def initialize(@tool, @enabled, @ratio)
  end

end

