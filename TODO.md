# TODO

* General
  * Requires at beginning of all files to avoid file dependency hell
  * Check for binaries in toolset before executing them in command
  * Backup threshold
    * Auto-remove oldest after certain backup count threshold
    * Warn if threshold is larger than the output directory can hold
      For example if the last archive was 30GB and the output dir can hold 1.2TB
      then it can hold 40 backups. If the backup threshold is at 50 then the output
      directory will run out of space before that threshold is ever met
  * Commands and controllers both pass around the same set of variables, it'd be nice to group them
    into like a State or Environment class
  * Hide error and just show short message on fail:
    "Error: Invalid option: --foobarbaz" instead of full stacktrace unless verbose
* Options
  * Default locations
    * Search order
      * CLI Option
      * ($XDG_CONFIG_HOME|~/.config)/cutback/config.{yaml,yml,json,js}
      * /etc/cutback/config.{yaml,yml,json,js}
  * Interpolations or options for commands
    * Interpolations
      * This would mean the current Command system needs to replaced with a run-time implementation
    * Options
      * These would require interpolations within themselves, for example `xz` needs
        `-T #{@paths.manifest}` so it could do something like `-T %{manifest}`
* Templates
  * Remove help and version as they are unused now due to Definitions
* Definitions
  * Add `config` boolean for options to disallow setting within config files (date, index)
* Metadata
  * `save` should check for @options.dry?
* Documentation
  * Config man page
  * Document supported compressors
  * Man
    ```
    See \fI<%= name %>(5)\fR for config file details.
    \fBDefault:\fR \fI"."\fR
    \fBDefault:\fR The current date
    \fBDefault:\fR The largest index for the current date incremented by \fI1\fR or \fI0\fR
    \fBValid:\fR \fI"yaml"\fR or \fI"json"\fR
    \fBDefault:\fR \fI"yaml"\fR
    ```
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
* Internationalization
  * embed/i18n.yml
  * Error messages
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
* Output to scripts
  * User could use Cutback to create shell scripts, since all cutback really does is generate and
    run "scripts" anyways.

