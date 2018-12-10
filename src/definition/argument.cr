class Generate::Definition::Argument < Generate::Definition

  mapping(
    name:        String,
    description: String,
    optional:    Bool,
  )

  formatters help, man

end

