# Cutback

<%= description %>

## Installation

### Manual

```sh
$ make
$ sudo make install

# Or
$ sudo make DESTDIR="/" install
```

## Strategy

<%= strategy %>

### Manifest

The list of all files within the search paths, sans exclusions.

Used for creating the archive and verification of the archive contents.

### Records

The list of all files within the search paths, filtered by the records list.

Used to keep the archive size (and backup duration) low as files within the records should be
easily reaquirable (from external media, internet, etc.)

### Archive

The (optionally compressed) archive created from the file list within the manifest.

### Checksum

The checksum of the archive, for verification purposes.

### Metadata

The list of all files in the backup (manifest, records, archive, checksum) as well as information
about each of them:

* Backup
  * Datetime (UTC)
  * Search paths
* Manifest
  * Number of files
  * Total sum of the size of files in list
* Records
  * Number of files
  * Total sum of the size of files in list
* Archive
  * Compression
    * Tool (gz, xz, etc)
    * Enabled
    * Compression ratio
  * Archive size

## Usage

The following will backup all files in the current user's home directory as well as a public
`/srv/public` directory.

All nodes with the `node_modules`, `.bundle`, and `.cache` name will not be included in the file list
or the archive.

In addition, public `Videos` directory at any depth will not be included, but will have a record kept
of alongside the archive.  
This will cut the archive size down significantly, as the videos can easily be reacquired.

```sh
$ cutback --paths '~;/srv/public' --excludes 'node_modules;.bundle;.cache' --records '/srv/public/*/{Songs,Videos}'
```

Cutback can also be configured from a [YAML][yaml] or [JSON][json] file with the `--config` option:

```sh
$ cutback --config backup.yaml
```

`backup.yaml`

> Note that paths do not have to be surrounded by quotation marks but every now and then YAML doesn't
> assume the value is a String, so we stick to surrounding with quotations every time.

```yaml
paths:             # Paths to search for files
  - "~"
  - "/srv/public"
excludes:          # Paths to exclude from the file list
  - "node_modules"
  - ".bundle"
  - ".cache"
records:           # Paths to keep a record of, also excluded from the file list
  - "/srv/public/*/Videos"
```

### Viewing Progress

If [PV][pv] is installed, you can pass the `--progress/-P` option 

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/cutback/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

<%= app["mit_license"] %>

[yaml]:     http://yaml.org/
[json]:     http://json.org/
[pv]:       https://ivarch.com/programs/pv.shtml
[progress]: #Viewing-Progress

