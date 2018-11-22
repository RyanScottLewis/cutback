class Cutback::Metadata::Archive::Compression < Cutback::Metadata::Base

  Cutback.mapping({
    tool:    String,
    enabled: Bool,
    ratio:   Float64,
  })

  def initialize(@tool, @enabled, @ratio)
  end

end

