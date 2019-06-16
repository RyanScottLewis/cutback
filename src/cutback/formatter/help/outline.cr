class Cutback::Formatter::Help::Outline < Cutback::Formatter

  @definition : Definition::Application

  def initialize(@definition)
  end

  def to_s(io)
    version = "v#{@definition.version}"

    io << [@definition.name, version, "-", @definition.summary].flatten.join(" ")
  end

end

