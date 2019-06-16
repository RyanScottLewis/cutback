module Cutback::Helpers::CommandExecution

  delegate options, paths, tools, logger, to: @application

  macro command(name, **arguments)
    Command::{{name.id.camelcase}}.new(options, paths, tools, logger, {{**arguments}})
  end

  # TODO: Rename to run_command
  macro run(name, **arguments)
    command({{name}}, {{**arguments}}).execute
  end

end

