# TODO: Rename to Serializable
module Cutback::Helpers::Mappable

  macro included
    include YAML::Serializable
    include JSON::Serializable
  end

end

