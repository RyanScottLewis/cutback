class Generate::Definition::Option < Generate::Definition

  mapping(
    name:        String,
    description: String,
    short:       String,
    type:        String,
  )

  formatters help, man

end

