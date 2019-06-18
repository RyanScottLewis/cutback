# TODO

* Documentation
  * Embed Overview.svg within README
* Packaging
  * Package all under directory `NAME-VERSION/` so it doesnt extract into the current directory
* Generator
  * Forward missing methods to `app` to avoid the excessive `app.` prefixes within templates
  * Generate PKGBUILD?
    * Then `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`
  * Generate website
    * Can be generated and hosted from `/doc/site` on GitHub Pages?
      See: https://stackoverflow.com/a/55505885/139089
* General
  * Requires at beginning of all files to avoid file dependency hell
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
  * Fallbacks
    * Allow arrays within archiver, checker, etc options
  * Allow `fzf` and other file finders besides just `find`
  * Use `Process.new` to run commands somehow, this will allow me to get the process ID in order to
    gather process stats while it is running and report to logger after it is finished
    See: `Process#terminated?`
    * Stats which are YAML parsable:
      * /proc/PID/io
      * /proc/PID/status
* Controllers
  * Delete confirmation
    * Unless `--force`
  * Skippable actions
    If an action cannot execute but can be skipped (cannot compress because no compressor is available)

