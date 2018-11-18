require "baked_file_system"

class Cutback::Embed
  extend BakedFileSystem

  bake_folder "./embed"
end

