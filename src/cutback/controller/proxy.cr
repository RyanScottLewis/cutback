class Cutback::Controller::Proxy < Cutback::Controller

  actions help, version, create, read, update, destroy, metadata, verify

  delegate_actions help, version,                 to: application
  delegate_actions create, read, update, destroy, to: backup
  delegate_action  metadata,                      to: metadata, action: read
  delegate_actions verify,                        to: checksum

end

