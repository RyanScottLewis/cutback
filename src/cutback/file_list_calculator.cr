class Cutback::FileListCalculator
  # TODO: This should be cached as BACKUP_NAME.manifest.size

  def self.calculate(path)
    new.calculate(path)
  end

  getter count : Int32 = 0
  getter bytes : Int64 = 0

  def calculate(path)
    data   = File.read(path.to_s)
    lines  = data.lines
    @count = lines.size
    @bytes = lines.sum { |path| File.size(path) }

    self
  end

end

