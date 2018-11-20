# TOOD

* Logger
* Options
  * `--verbose [LEVEL]`
    * Level 0: Display nothing
    * Level 1: Display logger messages
    * Level 2: Display system commands
  * `--dry`
    * See `Cutback::Command#execute`
* Commands
  * `generate [TYPE]`
    * `archive`
    * `metadata`
  * `inspect [TYPE]`
    * `manifest`/`records`
      * Path count
      * Total size of app files
      * Biggest and smallest files
    * `archive`
      * Compression type & level
      * Size
    * `metadata`
      * Print the metadata
    * `options`
  * `checksum`

