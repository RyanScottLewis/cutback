class Cutback::Metadata::Backup

  Cutback.mapping({
    date:  { type: Time },
    paths: { type: Array(String) },
  })

  def initialize(@date, @paths)
  end

end

