# ssh config file

- Read this for [multiple account setup](https://stackoverflow.com/questions/2419566/best-way-to-use-multiple-ssh-private-keys-on-one-client)
- Read this for [bitbucket key generation](https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/)

## Template

```sh
# github
Host github.com
  HostName github.com
  IdentityFile ~/.ssh/id_rsa
  AddKeysToAgent yes
  UseKeychain yes

# bitbucket
Host bitbucket.org
  HostName bitbucket.org
  IdentityFile ~/.ssh/id_bitbucket_rsa
  AddKeysToAgent yes
  UseKeychain yes

# personal
Host personal
  HostName github.com
  IdentityFile ~/.ssh/id_rsa
  AddKeysToAgent yes
  UseKeychain yes

# company
Host company
  HostName github.com
  IdentityFile ~/.ssh/id_rsa
  AddKeysToAgent yes
  UseKeychain yes
```

### LICENSE

MIT
