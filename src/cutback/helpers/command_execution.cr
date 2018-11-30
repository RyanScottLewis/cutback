module Cutback::Helpers::CommandExecution

  macro command(name, **arguments)
    Command::{{name.id.camelcase}}.new(@options, @paths, @tools, @logger, {{**arguments}})
  end

  macro run(name, **arguments)
    command({{name}}, {{**arguments}}).execute
  end

end

