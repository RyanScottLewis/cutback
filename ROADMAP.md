# Roadmap

## 0.1.0

* Proper error handling
* Tool validation using `which`
  Before routing? Or fail gracefully and continue operating, for example:
    WARN: Cannot compress backup, unknown archiver

## 0.2.0

* Default config file locations
  Search order:
    * CLI Option
    * ($XDG_CONFIG_HOME|~/.config)/cutback/config.{yaml,yml,json,js}
    * /etc/cutback/config.{yaml,yml,json,js}
* Encrypted archives:
  OpenSSL

  Encrypt: `tar cz folder_to_encrypt | openssl enc -aes-256-cbc -e > out.tar.gz.enc`
  Decrypt: `openssl enc -aes-256-cbc -d -in out.tar.gz.enc | tar xz`

  GPG

  Encrypt: `gpg --encrypt out.tar.gz`
  Decrypt: `gpg --decrypt out.tar.gz`

## 0.3.0

* Option interpolations
  * Right now, we use predetermined tools and we assume any tool passed to the option works like
    the default tool for that option. Users should be able to set entire commands, although some
    commands are quite complicated (see `find` or `compress`)
  * These would require interpolations within themselves, for example `xz` needs
    `-T #{@paths.manifest}` so it could do something like `-T %{manifest}`

## Future

* 100% code documentation coverage
  * Document supported compressors
* 100% code test coverage
* Configuration file man page
* Website
  * Static, generated from `app.yml`
  * Hosting releases (cloned from GitHub releases)
* Internationalization
  * embed/i18n.yml
  * Error messages
* Output to scripts
  * User could use Cutback to create shell scripts, since all cutback really does is generate and
    run "scripts" anyways.
* Backup threshold
  * Auto-remove oldest after certain backup count threshold
  * Warn if threshold is larger than the output directory can hold
    For example if the last archive was 30GB and the output dir can hold 1.2TB
    then it can hold 40 backups. If the backup threshold is at 50 then the output
    directory will run out of space before that threshold is ever met
