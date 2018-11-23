# TODO

* When generating, the index should be incremented by 1 if no --index was given
* Logger
* Options
  * `--verbose [LEVEL]`
    * Level 0: Display nothing
    * Level 1: Display logger messages
    * Level 2: Display system commands
  * `--dry`
    * See `Cutback::Command#execute`
  * `output` option, when from config, should be relative to the config file
  * Paths should only be invalid when used in a generate manifest/records
* Check for binaries in toolset before executing them in command
* embed/i18n.yml
  * Error messages

