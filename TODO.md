# TODO

* Documentation
  * Config man page
  * Man/help for --compressor/-x
  * Generator reads controllers and their actions pragmatically 
* Tests
* Options
  * `--verbose [LEVEL]`
    * Level 0: Display nothing
    * Level 1: Display logger messages
    * Level 2: Display system commands
  * `output` option, when from config, should be relative to the config file
  * Paths should only be invalid when used in a generate manifest/records
  * `--index +` to increment index
    * So without `--index`, the largest daily index is used so when run twice, the second time will do nothing (similar to make)
      But, with `-i +`, it'll increment the index by 1 and generate
* Arguments
  * Swap arguments eg: `generate [archive]` to `archive [generate]`
* Check for binaries in toolset before executing them in command
* embed/i18n.yml
  * Error messages
* Auto-remove oldest after certain backup count threshold
  * Warn if threshold is larger than the output directory can hold
    For example if the last archive was 30GB and the output dir can hold 1.2TB
    then it can hold 40 backups. If the backup threshold is at 50 then the output
    directory will run out of space before that threshold is ever met
* `IO::MultiWriter` is screwy, but log to both STDOUT and log files
* Command
  * Use `Process.new` to run commands somehow, this will allow me to get the process ID in order to
    gather process stats while it is running and report to logger after it is finished
    See: `Process#terminated?`
    * Stats which are YAML parsable:
      * /proc/PID/io
      * /proc/PID/status
* Controllers
  * `.all` should not return abstract classes
  * Helper for running commands
* Commands and controllers both pass around the same set of variables, it'd be nice to group them
  into like a State or Environment class


