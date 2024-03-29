class Cutback::Command::Compress < Cutback::Command

  def generate
    append tools.compressor
    append_arguments
    append_error
  end

  protected def append_arguments
    case tools.compressor
    when "bzip2" then append_unthreaded_arguments
    when "gzip"  then append_unthreaded_arguments
    when "lrzip" then append_lrzip_arguments
    when "lz4"   then append_unthreaded_arguments
    when "lzip"  then append_unthreaded_arguments
    when "lzma"  then append_threaded_arguments
    when "lzop"  then append_unthreaded_arguments
    when "xz"    then append_threaded_arguments
    else
      # TODO: Write which compressor lol
      logger.warn("Using unknown compressor")
      # TODO: Should append_level_flag?
      # Could possibly make it a config: compress_append_level_option
      # Also could do the same for --threads: compress_append_threads_option

      nil
    end
  end

  protected def append_level_flag
    append "-#{options.compress_level}"
  end

  protected def append_threads_flag
    append "--threads #{options.compress_threads}" unless tools.compressor == "lrzip"
  end

  protected def append_threaded_arguments
    append_level_flag
    append_threads_flag
  end

  protected def append_unthreaded_arguments
    logger.warn("Using multiple threads is unavailable")

    append_level_flag
  end

  protected def append_lrzip_arguments
    append "-L #{options.compress_level}"
    append_threads_flag
  end

end

