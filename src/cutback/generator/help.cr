class Cutback::Generator::Help < Cutback::Generator

  @app : Definition::Root

  def initialize(@app)
    @app.for = :help # TODO: I hate this
  end

  def generate
    String.build do |io|
      io.puts @app.outline
      io.puts
      io.puts "Usage: %s" % @app.usage
      io.puts
      io.puts @app.description
      io.puts
      io.puts "Arguments:"
      io.puts @app.arguments.to_s.indent
      io.puts
      io.puts "Options:"
      io.puts @app.options.to_s.indent
      io.puts
      io.puts "Controllers & Actions:"
      io.puts @app.controllers.to_s.indent
      io.puts
      io.puts "See `man 1 %s` for more detailed information." % @app.name
      io.puts "See `man 5 %s` for configuration file information." % @app.name
    end
  end

end

