class Cutback::Command::Compress < Cutback::Command::Base

  def to_s(io)
    join(io,
      @options.toolchain.compress,
      "-#{@options.compress_level}",           # Compression level
      "--threads #{@options.compress_threads}" # Threads to use
    )
  end

end

