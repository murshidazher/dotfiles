# ssh config file

> Read this for [multiple account setup](https://stackoverflow.com/questions/2419566/best-way-to-use-multiple-ssh-private-keys-on-one-client)

- Read this for [bitbucket key generation](https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/)

## Template

```sh
# default github
Host github.com
HostName github.com
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_rsa

# Bitbucket account
Host bitbucket.org
HostName bitbucket.org
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_bitbucket_rsa

# Personal account
Host personal
HostName github.com
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_rsa

# Company account
Host company
HostName github.com
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_rsa

```
