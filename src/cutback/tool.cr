class Cutback::Tool

  Cutback.mapping({
    tool:  { type: String },
    flags: { type: Array(String) },
  })

  property tool  : String
  property flags : Array(String)

  def initialize(@tool, @flags)
  end

  def to_s(*arguments)
    [@tool, @flags, arguments].flatten.join(" ")
  end

end

