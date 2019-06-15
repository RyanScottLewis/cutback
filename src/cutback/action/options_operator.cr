class Cutback::Action::OptionsOperator < Cutback::Action

  include Helpers::GeneratorExecution

  @app     : Definition::App
  @options : Options

  def initialize(@app, @options)
  end

  def execute
    check_help
    check_version
  end

  protected def check_help
    return unless @options.help

    puts generate(:help, @app)
    exit
  end

  protected def check_version
    return unless @options.version

    puts @app.version
    exit
  end

end

