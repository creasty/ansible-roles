Role: user
==========

Excerpt
-------

- create an user
- setup authorized_key
- copy id_rsa
- copy the user's sudoers


Configuration
-------------

```yaml
user:
  name:              webapp
  path:              /home/webapp
  login_pubkey_file: ...
  id_rsa_file:       ...
```

