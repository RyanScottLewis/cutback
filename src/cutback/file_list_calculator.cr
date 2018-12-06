class Cutback::FileListCalculator

  def self.calculate(path)
    new.calculate(path)
  end

  getter count : Int32  = 0
  getter bytes : UInt64 = 0

  def calculate(path)
    data   = File.read(path.to_s)
    lines  = data.lines
    @count = lines.size
    @bytes = lines.sum { |path| File.size(path) }

    self
  end

end
