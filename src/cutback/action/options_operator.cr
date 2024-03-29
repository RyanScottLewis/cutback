# TODO: Better name
class Cutback::Action::OptionsOperator < Cutback::Action

  include Helpers::GeneratorExecution

  delegate definition, options, to: application

  def execute
    check_help
    check_version
  end

  protected def check_help
    return unless options.help

    puts generate(:help, definition)
    exit
  end

  protected def check_version
    return unless options.version

    puts definition.version
    exit
  end

end

