# TODO

* Config man page
* Tests
* Options
  * `--verbose [LEVEL]`
    * Level 0: Display nothing
    * Level 1: Display logger messages
    * Level 2: Display system commands
  * `output` option, when from config, should be relative to the config file
  * Paths should only be invalid when used in a generate manifest/records
* Check for binaries in toolset before executing them in command
* embed/i18n.yml
  * Error messages
* Index is starting at 1, not 0
* Auto-remove oldest after certain backup count threshold
  * Warn if threshold is larger than the output directory can hold
    For example if the last archive was 30GB and the output dir can hold 1.2TB
    then it can hold 40 backups. If the backup threshold is at 50 then the output
    directory will run out of space before that threshold is ever met
* `IO::MultiWriter` is screwy, but log to both STDOUT and log files

