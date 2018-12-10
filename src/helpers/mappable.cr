module Cutback::Helpers::Mappable

  macro mapping(**properties)
    YAML.mapping({{properties}})
    JSON.mapping({{properties}})
  end

end

