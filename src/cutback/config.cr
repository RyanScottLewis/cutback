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

  Cutback.mapping({
    output:   String?,
    paths:    Array(String)?,
    excludes: Array(String)?,
    records:  Array(String)?,
    format:   String?,
    compress: Bool?,
    progress: Bool?,
  })

  def initialize(options : Options)
    update(options)
  end

  macro update_option(options, name)
    options.{{name}} = @{{name}}.not_nil! unless @{{name}}.nil?
  end

  def update_options(options : Options)
    update_option(options, output)
    update_option(options, paths)
    update_option(options, excludes)
    update_option(options, records)
    update_option(options, format)
    update_option(options, compress)
    update_option(options, progress)
  end

  macro update_config(options, name)
    @{{name}} = options.{{name}}
  end

  def update(options : Options)
    update_config(options, output)
    update_config(options, paths)
    update_config(options, excludes)
    update_config(options, records)
    update_config(options, format)
    update_config(options, compress)
    update_config(options, progress)
  end

end

