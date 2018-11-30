module Cutback::Helpers::Mapping

  macro mapping(value)
    YAML.mapping({{value}})
    JSON.mapping({{value}})
  end

end

