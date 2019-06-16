class Cutback::Generator::Help < Cutback::Generator

  @definition : Definition::Application

  def initialize(@definition)
    @definition.for = :help # TODO: I hate this
  end

  def generate
    String.build do |io|
      io.puts @definition.outline
      io.puts
      io.puts "Usage: %s" % @definition.usage
      io.puts
      io.puts @definition.description
      io.puts
      io.puts "Arguments:"
      io.puts @definition.arguments.to_s.indent
      io.puts
      io.puts "Options:"
      io.puts @definition.options.to_s.indent
      io.puts
      io.puts "Controllers & Actions:"
      io.puts @definition.controllers.to_s.indent
      io.puts
      io.puts "See `man 1 %s` for more detailed information." % @definition.name
      io.puts "See `man 5 %s` for configuration file information." % @definition.name
    end
  end

end

