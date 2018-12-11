class Cutback::Formatter::Man::Usage < Cutback::Formatter

  @app : Definition::App

  def initialize(@app)
  end

  def to_s(io)
    io << @app.name.to_roff.bold

    @app.arguments.each do |argument|
      io << " ["
      io << argument.name.upcase.to_roff.italic
      io << "]"
    end

    io << "\n.br\n"

    io << @app.name.to_roff.bold

    [@app.arguments[0], @app.arguments[2]].each do |argument|
      io << " ["
      io << argument.name.upcase.to_roff.italic
      io << "]"
    end
  end

end

