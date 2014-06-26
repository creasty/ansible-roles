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
  name:           webapp
  path:           /home/webapp
  authorized_key: webapp
  id_rsa:         id_rsa
```


Files
-----

- `/files/user/{{ user.authorized_key }}.pub`: SSH public-key file to login to the user
- `/files/user/{{ user.id_rsa }}`: User's default ssh secret-key file

