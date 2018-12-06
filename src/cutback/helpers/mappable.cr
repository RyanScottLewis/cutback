module Cutback::Helpers::Mappable

  macro mapping(value)
    YAML.mapping({{value}})
    JSON.mapping({{value}})
  end

end

