class Cutback::Metadata

  class Backup

    Cutback.mapping({
      datetime: { type: Time,          default: Time.epoch(0) },
      paths:    { type: Array(String), default: [] of String },
    })

    def initialize(@datetime=Time.utc_now, @paths=[] of String)
    end

  end

  class FileList

    Cutback.mapping({
      count: { type: UInt64, default: 0.to_u64 },
      size:  { type: UInt64, default: 0.to_u64 },
    })

    def initialize(@count=0.to_u64, @size=0.to_u64)
    end

  end

  class Archive

    class Compression

      Cutback.mapping({
        enabled: { type: Bool,   default: false },
        tool:    { type: String, default: "" },
        flags:   { type: String, default: "" },
      })

      def initialize(@enabled=false, @tool="", @flags="")
      end

    end

    class Checksum

      Cutback.mapping({
        tool:  { type: String, default: "" },
        value: { type: String, default: "" },
      })

      def initialize(@tool="", @value="")
      end

    end

    Cutback.mapping({
      compression: { type: Compression, default: Compression.new },
      checksum:    { type: Checksum,    default: Checksum.new },
    })

    def initialize(@compression=Compression.new, @checksum=Checksum.new)
    end

  end

  Cutback.mapping({
    backup:   { type: Backup,   default: Backup.new },
    manifest: { type: FileList, default: FileList.new },
    records:  { type: FileList, default: FileList.new },
    archive:  { type: Archive,  default: Archive.new },
  })

  def initialize(@backup=Backup.new, @manifest=FileList.new, @records=FileList.new, @archive=Archive.new)
  end

end

