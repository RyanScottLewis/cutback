class Cutback::Embed
  extend BakedFileSystem

  bake_folder "embed", allow_empty: true

  def self.[](name)
    file = get?(name)
    return "" if file.nil?

    file.not_nil!.gets_to_end
  end
end

