module Cutback::Helpers::CommandExecution

  macro command(name, **arguments)
    Command::{{name.id.camelcase}}.new(application, {{**arguments}})
  end

  # TODO: Rename to run_command
  macro run(name, **arguments)
    command({{name}}, {{**arguments}}).execute
  end

end

