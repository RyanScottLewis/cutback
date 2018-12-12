class Cutback::List::Path < Cutback::List(Cutback::Path)

  key_delegate(log)
  key_delegate(manifest)
  key_delegate(records)
  key_delegate(archive)
  key_delegate(checksum)
  key_delegate(metadata)
  key_delegate(config)

end

