class Cutback::Definition::Option < Cutback::Definition

  alias Value = Bool | Int32 | String | Time | Array(String)

  property name        : String
  property description : String
  property short       : String?
  property type        : String
  property default     : Value?

  formatters help, man

end

