class Generate::App::Option < Generate::App

  YAML.mapping(
    name:        String,
    description: String,
    short:       String,
    type:        String,
  )

  def to_s(io)
    io << case @for
    when :man then Formatter::Option::Man.format(self)
    else;          Formatter::Option.format(self)
    end
  end

end

