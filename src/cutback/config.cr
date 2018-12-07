class Cutback::Config

  def self.load(path)
    extname = File.extname(path).gsub(/yml$/, "yaml")

    case extname
    when ".yaml"
      from_yaml(File.read(path))
    when ".json"
      from_json(File.read(path))
    else
      raise Error::InvalidExtension.new
    end
  end

  include Helpers::Dumpable
  include Helpers::Mappable

  mapping(
    output:           String?,
    paths:            Array(String)?,
    excludes:         Array(String)?,
    records:          Array(String)?,
    format:           String?,
    compress:         Bool?,
    progress:         Bool?,
    compress_level:   Int32?,
    compress_threads: Int32?,
    archiver:         String?,
    checker:          String?,
    compressor:       String?,
    finder:           String?,
    reader:           String?,
    viewer:           String?,
  )

  def initialize(options : Options)
    update(options)
  end

  macro update_config(parent, name)
    @{{name}} = {{parent}}.{{name}}
  end

  def update(options : Options)
    update_config(options, output)
    update_config(options, paths)
    update_config(options, excludes)
    update_config(options, records)
    update_config(options, format)
    update_config(options, compress)
    update_config(options, progress)
    update_config(options, compress_level)
    update_config(options, compress_threads)
    update_config(options, archiver)
    update_config(options, checker)
    update_config(options, compressor)
    update_config(options, finder)
    update_config(options, reader)
    update_config(options, viewer)
  end

end

