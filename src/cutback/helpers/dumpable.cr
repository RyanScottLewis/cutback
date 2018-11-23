module Cutback::Helpers::Dumpable

  def dump(format="yaml")
    case format
    when "yaml" then to_yaml
    when "json" then to_pretty_json
    else
      raise Error::InvalidFormat.new
    end
  end

  def save(path, format="yaml")
    File.write(path, dump(format))
  end

end

