module Cutback::Helpers::MetadataCreation

  macro metadata_for(name, *arguments)
    Cutback::Metadata::{{name.id.camelcase}}.new({{*arguments}})
  end

  macro show_metadata_for(name, *arguments)
    metadata = metadata_for({{name.id}}, {{*arguments}})

    puts metadata.dump(options.format)
  end

  macro save_metadata_for(name, *arguments)
    metadata = metadata_for({{name.id}}, {{*arguments}})

    metadata.save(paths.metadata, options.format)
  end

end

