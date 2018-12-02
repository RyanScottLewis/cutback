class Cutback::Controller::Proxy < Cutback::Controller

  actions help, version, create, read, update, destroy, verify

  delegate_action help, version, to: application
  delegate_action create, read, update, destroy, to: backup
  delegate_action verify, to: checksum

end

