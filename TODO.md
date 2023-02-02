# TODO

* Move to GitHub issues
* Move all TODOs within codebase into GitHub issues?
* Use time and timezone in filename dates (uses utc atm but theres no way to know from filenames)
* Generate `.sh` files within the backup files
  * 2023-01-23-000.archive-create.sh
  * 2023-01-23-000.checksum-verify.sh
  * etc for each controller + action
  * config for generationg any/all of these
  * This could allow a host to translate an easy to read Cutback configuration directly into shell
    scripts and deploy them to other nodes without them even having to install/utilize cutback
* bash and zsh auto completion
  * Is there a generator for this sort of thing? Otherwise I'm making a `template/` file.
* Uplaod operation defaulting to `rclone` after backup generation
  * Enforce 3-2-1 backup scheme
