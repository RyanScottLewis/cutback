class Generate::App::Action < Generate::App

  YAML.mapping(
    name:        String,
    description: String,
  )

  def to_s(io)
    io << case @for
    when :man       then Formatter::Action::Man.format(self)
    else;                Formatter::Action.format(self)
    end
  end

end

