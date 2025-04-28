# TODO

* Move to GitHub issues
* Move all TODOs within codebase into GitHub issues?
* Use time and timezone in filename dates (uses utc atm but theres no way to know from filenames)
* `script create`
  * Generate `.sh` files within the backup files
    * 2023-01-23-000.archive-create.sh
    * 2023-01-23-000.checksum-verify.sh
    * etc for each controller + action
    * config for generationg any/all of these
    * This could allow a host to translate an easy to read Cutback configuration directly into shell
      scripts and deploy them to other nodes without them even having to install/utilize cutback
* bash and zsh auto completion
  * Is there a generator for this sort of thing? Otherwise I'm making a `template/` file.
* Uplaod operation defaulting to `rclone` after backup generation
  * Enforce 3-2-1 backup scheme
* Create the backup's config file as the first action
  * Add an interactive mode which asks user if they'd like to verify/edit the config before continuing
* Remove `config view` because `config read` exists
* Reading then Diffing
  * After generating archive, diff the manifest with the contents of the archive to serve as a double check before creating checksum.
  * Otherwise, if the archive was built corrupt then all you're doing is generating a checksum of a corrupt archive, which sucks.
* Bundling and possibly Bundle Archiving
  * This is written down in a TODO in cutback project or the issue list but; bundle all generated files into a tarball, with the option of compressing the bundle.
* Encryption
  * Any time a tarball or archive is created (Archiving or Bundle Archiving steps) add the ability to password encrypt the archive
* Manifest & Records Compression
* In Cutback, the records list could be used to start a procedure to collect all the record files and split them up into ISOs for physical backup (or zip for remote backup) - ISOs specifically sized to DVD-Rs for example
* Searching
  * Use `locate` utility which uses a `locatedb`, updated with `updatedb`
  * File filter conditionals and actions
    * If the file is in this folder or path pattern AND it's size is greater than 500MiB
      * Add to *records* rather than *manifest*
* New order:
  * `config create`
  * `manifest create`
  * `records create`
  * `archive create`
  * `checksum create`
  * `metadata create`
  * `script create`
  * `bundle create`
  * `encrypt create`
  * `upload create`
* Deduplication ala `borg`?
