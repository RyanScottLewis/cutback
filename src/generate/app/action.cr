class Generate::App::Action < Generate::App

  mapping(
    name:        String,
    description: String,
  )

  formatters help, man

end

