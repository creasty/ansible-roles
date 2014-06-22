Role: mysql
===========

Excerpt
-------

- install mysql packages
- install mysql python module
- copy configuration files
- start mysql service
- change root password for all hosts

and optionally,

- create a database
- create the database user


Configuration
-------------

```yaml
mysql:
  root_password: xxxxxxxx

  # [optional]
  database:
    name:     my_rails_app_production
    user:     my_rails_app
    password: xxxxxxxx
```

