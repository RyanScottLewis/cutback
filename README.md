# Cutback

Cutback is a backup system with the goal of creating smaller, more focused backups by generating
filtered file lists before archiving and keeping records of easily reaquirable files.

## Installation

### Manual

```sh
$ make
$ sudo make install

# Or
$ sudo make DESTDIR="/" install
```

## Strategy

1. Search
  * Manifest
  * Records
2. Archive
  * Compress
  * Checksum
3. Generate
  * Metadata

### Search

The first step is to search all paths listed in the `paths` configuration variable for all files
recursively.

All file patterns listed in the `excludes` configuration variable are excluded from this search
entirely. File patterns allow for wildcards to be used instead of (or as well as) absolute paths to
exclude whole subtrees of files.

Files matching the file patterns listed in the `records` configuration variable are added to a list
of files to keep a record of.

Records are usually files that are low priority and easily reaquirable, such as movies, music, tv
shows, etc. These files take up a lot of space and generally have a physical backup which means
backing them up would be a waste of precious space. This also vastly improves the duration of the
backup process, for both archiving and unarchiving.

This list of records is located in the output directory, denoted with a `.records` suffix.

All other files found within the search, are added to a list in the output directory, called the
manifest, and denoted with a `.manifest` suffix.

### Archive

The manifest of files found in the previous step is now used to create the backup archive.  
This archive is optionally compressed and denoted with a `.tar[.COMPRESSION]` suffix.

A checksum is then generated from the archive.

## Generate

Information about the backup is recorded and saved with the suffix appropriate for the format in the
`format` configuration variable:

* Backup
  * Date & time (UTC)
  * Search paths
  * Duration
* Manifest
  * File count
  * Total file size
* Archive
  * Compression
    * Enabled
    * Tool (gzip, xz, etc.)
    * Flags (passed to the tool)
  * Checksum
    * Tool (sha256sum, sha512sum, etc.)
    * Value
  * Size
    * Byte count
    * Human readable

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

1. Fork it (<https://github.com/RyanScottLewis/cutback/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

This program is available as open source under the terms of the MIT License <http://opensource.org/licenses/MIT>.

[yaml]:     http://yaml.org/
[json]:     http://json.org/
[pv]:       https://ivarch.com/programs/pv.shtml
[progress]: #Viewing-Progress

