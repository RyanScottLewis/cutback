class Cutback::Metadata::Compression < Cutback::Metadata

  property tool    : String
  property enabled : Bool
  property ratio   : Float64

  def initialize(@tool, @enabled, @ratio)
  end

end

