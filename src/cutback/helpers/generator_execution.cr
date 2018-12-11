module Cutback::Helpers::GeneratorExecution

  macro generate(name, *arguments)
    Generator::{{name.id.camelcase}}.generate({{*arguments}})
  end

end

