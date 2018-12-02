# TODO

* List classes
  * Should have a single base class
  * Should use SYMBOLS instead of strings and convert when needed
* Metadata
  * `Metadata::Archive.new(@options, @paths, @tools)`
  * `save` should check for @options.dry?
* Documentation
  * Config man page
  * Man/help for --compressor/-x
  * Generator reads controllers and their actions pragmatically 
  * Man
    ```
    See \fI<%= name %>(5)\fR for config file details.
    \fBDefault:\fR \fI"."\fR
    \fBDefault:\fR The current date
    \fBDefault:\fR The largest index for the current date incremented by \fI1\fR or \fI0\fR
    \fBValid:\fR \fI"yaml"\fR or \fI"json"\fR
    \fBDefault:\fR \fI"yaml"\fR
    ```
* Tests
* Options
  * Generate `Cutback::Options` and `Processor::Options#define_options`
    * Right now when an option needs to be added or modified the following paths have to be edited
      * `app.yml`
      * `src/cutback/options.cr`
      * `src/cutback/processor/options.cr`
      This should JUST be `app.yml`
  * `--verbose [LEVEL]`
    * Level 0: Display nothing
    * Level 1: Display logger messages
    * Level 2: Display system commands
  * `output` option, when from config, should be relative to the config file
  * Paths should only be invalid when used in a generate manifest/records
  * `--index +` to increment index
    * So without `--index`, the largest daily index is used so when run twice, the second time will do nothing (similar to make)
      But, with `-i +`, it'll increment the index by 1 and generate
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
  * Default action
  * `.all` should not return abstract classes
  * Helper for running commands
  * Resource
    * File dependencies
    * `read` for most things should actually read resource and not show metadata
    * `update`
    * `destroy`
    * `metadata` (Which is what `read` does now)
* Commands and controllers both pass around the same set of variables, it'd be nice to group them
  into like a State or Environment class


