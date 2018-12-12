class Cutback::Formatter::Help::Option < Cutback::Formatter

  @option : Definition::Option

  def initialize(@option)
  end

  def bool?
    @option.type == "bool"
  end

  def flags
    String.build do |io|
      io << "-"
      io << @option.short
      io << ", --"
      io << @option.name
    end
  end

  def to_s(io)
    io << flags.ljust(bool? ? 31 : 23) # TODO: MAGIC NUMBER Get max length from somewhere
    io << "VALUE".ljust(8) unless bool?
    io << @option.description
  end

end

