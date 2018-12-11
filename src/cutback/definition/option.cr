class Cutback::Definition::Option < Cutback::Definition

  alias Value = Bool | Int32 | String | Time | Array(String)

  mapping(
    name:        String,
    description: String,
    short:       String?,
    type:        String,
    default:     Value?,
  )

  formatters help, man

end

