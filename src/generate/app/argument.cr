class Generate::App::Argument < Generate::App

  YAML.mapping(
    name:        String,
    description: String,
    optional:    Bool,
  )

  def to_s(io)
    io << case @for
    when :usage     then Formatter::Argument::Usage.format(self)
    when :usage_man then Formatter::Argument::UsageMan.format(self)
    when :man       then Formatter::Argument::Man.format(self)
    else;                Formatter::Argument.format(self)
    end
  end

end

