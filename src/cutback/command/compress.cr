class Cutback::Command::Compress < Cutback::Command::Base

  def generate
    append @tools.compressor
    append_arguments
    append_error
  end

  protected def append_arguments
    case @tools.compressor
    when "7z"    then append_7z_arguments
    when "bzip2" then append_default_arguments
    when "gzip"  then append_default_arguments
    when "lz4"   then append_default_arguments
    when "xz"    then append_threaded_arguments
    when "lzma"  then append_threaded_arguments
    when "zip"   then append_default_arguments
    else
      @logger.warn("Using unknown compressor")

      nil
    end
  end

  protected def default_level_flag
    append "-#{@options.compress_level}"
  end

  protected def default_threads_flag
    append "-T #{@options.compress_threads}"
  end

  protected def append_7z_arguments
    append "-mx=#{@options.compress_level}"
    append "-mmt=#{@options.compress_threads}"
  end

  protected def append_threaded_arguments
    default_level_flag
    default_threads_flag
  end

  protected def append_default_arguments
    @logger.warn("Using multiple threads is unavailable")

    default_level_flag
  end

end

