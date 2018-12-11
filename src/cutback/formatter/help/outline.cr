class Cutback::Formatter::Help::Outline < Cutback::Formatter

  @app : Definition::App

  def initialize(@app)
  end

  def to_s(io)
    version = "v#{@app.version}"

    io << [@app.name, version, "-", @app.summary].flatten.join(" ")
  end

end

