# TODO

* General
  * Requires at beginning of all files to avoid file dependency hell
  * Commands and controllers both pass around the same set of variables, it'd be nice to group them
    * a State or Environment class
    * Or pass only `@application` as dependency for all processors/controllers and have them delegate to
      `@application` or set instance variables for the dependencies needed `@foo = @application.foo`
* Definitions
  * Add `config` boolean for options to disallow setting within config files (date, index)
* Metadata
  * `save` should check for @options.dry?
* Options
  * `--verbose [LEVEL]`
    * Level 0: Display nothing
    * Level 1: Display logger messages
    * Level 2: Display system commands
  * `output` option, when from config, should be relative to the config file
  * Paths should only be invalid when used in a generate manifest/records
  * `--index +` to increment index
    * So without `--index`, the largest daily index is used so when run twice, the second time will
      do nothing (similar to make)
      But, with `-i +`, it'll increment the index by 1 and generate
* Command
  * Use `Process.new` to run commands somehow, this will allow me to get the process ID in order to
    gather process stats while it is running and report to logger after it is finished
    See: `Process#terminated?`
    * Stats which are YAML parsable:
      * /proc/PID/io
      * /proc/PID/status
* Controllers
  * Delete confirmation
    * Unless `--force`

