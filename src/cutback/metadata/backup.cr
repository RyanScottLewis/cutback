class Cutback::Metadata::Backup

  Cutback.mapping({
    date:  Time,
    paths: Array(String),
  })

  def initialize(@date, @paths)
  end

end

