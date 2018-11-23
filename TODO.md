# TODO

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
  * Paths should only be invalid when used in a generate manifest/records
* Commands
  * `generate/inspect config`
* Check for binaries in toolset before executing them in command
* embed/i18n.yml
  * Error messages

