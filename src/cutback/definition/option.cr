class Cutback::Definition::Option < Cutback::Definition

  mapping(
    name:        String,
    description: String,
    short:       String,
    type:        String,
  )

  formatters help, man

end

