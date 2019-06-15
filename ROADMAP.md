# Roadmap

## 0.1.0

* 100% code test coverage

## 0.2.0

* Encrypted archives:
  OpenSSL

  Encrypt: `tar cz folder_to_encrypt | openssl enc -aes-256-cbc -e > out.tar.gz.enc`
  Decrypt: `openssl enc -aes-256-cbc -d -in out.tar.gz.enc | tar xz`

  GPG

  Encrypt: `gpg --encrypt out.tar.gz`
  Decrypt: `gpg --decrypt out.tar.gz`

## 1.0.0

* Website
  * Static, generated from `app.yml`
  * Hosting releases (cloned from GitHub releases)
* 100% code documentation coverage

