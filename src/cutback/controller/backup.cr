class Cutback::Controller::Backup < Cutback::Controller

  actions create

  def create
    call("metadata#create")
  end

end

