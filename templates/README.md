# <%= app.name.capitalize %>

<%= app.description -%>

## Installation

### Manual

```sh
$ make
$ sudo make install

# Or
$ sudo make DESTDIR="/" install
```

## Usage

The following will backup all files in the current user's home directory as well as a public
`/srv/public` directory.

All nodes with the `node_modules`, `.bundle`, and `.cache` name will not be included in the file list
or the archive.

In addition, public `Videos` directory at any depth will not be included, but will have a record kept
of alongside the archive.  
This will cut the archive size down significantly, as the videos can easily be reacquired.

```sh
$ cutback --paths '~;/srv/public' --excludes 'node_modules;.bundle;.cache' --records '/srv/public/*/Videos'
```

Cutback can also be configured from a [YAML][yaml] or [JSON][json] file with the `--config` option:

```sh
$ cutback --config backup.yaml
```

Here is the above configuration options within a YAML file:

> Note that paths do not have to be surrounded by quotation marks but every now and then YAML doesn't
> assume the value is a String, so we stick to surrounding with quotations every time.

`backup.yaml`

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

## Strategy

1. Search
  * Generate manifest
  * Generate records
2. Archive
  * Compress archive
  * Generate checksum
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

### Generate

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

### Viewing Progress

If [PV][pv] is installed, you can pass the `--progress/-P` option to view the progress of the
current command, if applicable.

## Contributing

1. Fork it (<https://github.com/RyanScottLewis/cutback/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

<%= app.license %>

[yaml]:     http://yaml.org/
[json]:     http://json.org/
[pv]:       https://ivarch.com/programs/pv.shtml

