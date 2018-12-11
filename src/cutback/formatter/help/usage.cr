class Cutback::Formatter::Help::Usage < Cutback::Formatter

  @app : Definition::App

  def initialize(@app)
  end

  def to_s(io)
    io << @app.name

    @app.arguments.each do |argument|
      io << " ["
      io << argument.name.upcase
      io << "]"
    end

    io << "\n".ljust(8)

    io << @app.name

    [@app.arguments[0], @app.arguments[2]].each do |argument|
      io << " ["
      io << argument.name.upcase
      io << "]"
    end
  end

end

