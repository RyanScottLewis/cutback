class Generate::App::Option < Generate::App

  mapping(
    name:        String,
    description: String,
    short:       String,
    type:        String,
  )

  formatters help, man

end

