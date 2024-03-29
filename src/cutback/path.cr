class Cutback::Path

  def self.join(*partials)
    new.join(*partials)
  end

  @value : String

  def initialize(@value="")
  end

  delegate to_s, to: @value

  def modified_after?(path : Path)
    modification_time > path.modification_time
  end

  def join(*partials)
    Path.new(File.join(@value, *partials))
  end

  def expand
    Path.new(File.expand_path(@value))
  end

  def exists?
    File.exists?(@value)
  end

  def modification_time
    File.info(@value).modification_time
  end

  def directory?
    File.info(@value).directory?
  end

  def size
    File.size(@value)
  end

  def read
    File.read(@value)
  end

  def delete
    File.delete(@value)
  end

  def write(data)
    File.write(@value, data)
  end

  def open(flags = "r")
    File.open(@value, flags)
  end

end
