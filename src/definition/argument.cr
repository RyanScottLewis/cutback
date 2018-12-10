class Cutback::Definition::Argument < Cutback::Definition

  mapping(
    name:        String,
    description: String,
    optional:    Bool,
  )

  formatters help, man

end

