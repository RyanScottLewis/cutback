class Generate::App::Argument < Generate::App

  mapping(
    name:        String,
    description: String,
    optional:    Bool,
  )

  formatters help, man

end

