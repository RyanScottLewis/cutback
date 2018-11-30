class Cutback::Embed
  extend BakedFileSystem

  bake_folder "./embed"
end

module Cutback

  HELP    = Embed.get("help").gets_to_end rescue ""
  VERSION = Embed.get("version").gets_to_end rescue ""

end
