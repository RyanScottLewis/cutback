class Cutback::FileSize

  def self.convert(value)
    new(value).to_s
  end

  @value : UInt64

  def initialize(@value)
  end

  def to_s
    abs = @value.abs

    if (abs >= 0x1000000000000000) # Exabyte
      suffix = "EB"
      readable = (@value >> 50)
    elsif (abs >= 0x4000000000000) # Petabyte
      suffix = "PB"
      readable = (@value >> 40)
    elsif (abs >= 0x10000000000)   # Terabyte
      suffix = "TB"
      readable = (@value >> 30)
    elsif (abs >= 0x40000000)      # Gigabyte
      suffix = "GB"
      readable = (@value >> 20)
    elsif (abs >= 0x100000)        # Megabyte
      suffix = "MB"
      readable = (@value >> 10)
    elsif (abs >= 0x400)           # Kilobyte
      suffix = "KB"
      readable = @value
    else
      return "%d B" % @value       # Byte
    end

    readable = readable / 1024.0   # Divide by 1024 to get fractional value

    "%.2f %s" % [readable, suffix] # Return formatted number with suffix
  end

end

