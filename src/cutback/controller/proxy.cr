class Cutback::Controller::Proxy < Cutback::Controller

  actions help, version, create, read, update, destroy, verify,
          manifest, records, archive, checksum, metadata, config, backup

  delegate_actions help, version,                 to: application
  delegate_actions create, read, update, destroy, to: backup
  delegate_actions verify,                        to: checksum
  delegate_action  manifest,                      to: manifest, action: create
  delegate_action  records,                       to: records,  action: create
  delegate_action  archive,                       to: archive,  action: create
  delegate_action  checksum,                      to: checksum, action: create
  delegate_action  metadata,                      to: metadata, action: create
  delegate_action  config,                        to: config,   action: create
  delegate_action  backup,                        to: backup,   action: read

end

