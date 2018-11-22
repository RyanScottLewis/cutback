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

  Cutback.mapping({
    output:   String?,
    paths:    Array(String)?,
    excludes: Array(String)?,
    records:  Array(String)?,
    format:   String?,
    compress: Bool?,
    progress: Bool?,
  })

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

end

