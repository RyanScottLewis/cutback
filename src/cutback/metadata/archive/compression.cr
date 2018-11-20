class Cutback::Metadata::Archive::Compression

  Cutback.mapping({
    tool:    { type: String },
    enabled: { type: Bool },
  })

  def initialize(@tool, @enabled)
  end

end

