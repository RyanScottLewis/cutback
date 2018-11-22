class Cutback::Metadata::Backup < Cutback::Metadata::Base

  Cutback.mapping({
    date:  Time,
    paths: Array(String),
  })

  def initialize(@date, @paths)
  end

  def initialize(options : Options)
    @date  = options.date
    @paths = options.paths
  end

end

