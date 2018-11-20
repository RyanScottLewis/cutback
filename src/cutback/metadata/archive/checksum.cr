class Cutback::Metadata::Archive::Checksum

  Cutback.mapping({
    tool:  { type: String },
    value: { type: String },
  })

  def initialize(@tool, @value)
  end

end

