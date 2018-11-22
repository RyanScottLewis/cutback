# TOOD

* Logger
* Options
  * `--verbose [LEVEL]`
    * Level 0: Display nothing
    * Level 1: Display logger messages
    * Level 2: Display system commands
  * `--dry`
    * See `Cutback::Command#execute`
  * CLI options should override config options
  * `output` option, when from config, should be relative to the config file
  * Bool options should toggle known value (from default or config value)
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
* Check for binaries in toolset before executing them in command
