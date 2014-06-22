Role: backup
============

Excerpt
-------

- install backup gem
- copy configuration files


Configuration
-------------

```yaml
backup:
  db:
    database: my_rails_app_production
    user:     my_rails_app
    password: xxxxxxxx
    host:     localhost
    port:     3306
    socket:   true  # [optional]

  s3:
    access_key_id:     xxxxxxxx
    secret_access_key: xxxxxxxx
    region:            ap-northeast-1
    name:              bucket_name
    path:              /backup

  # [optional]
  notification_mail:
    address:  backup@example.com
    to:       personal@gmail.com
    server:   smtp.example.com
    port:     587
    domain:   example.com
    username: backup
    password: xxxxxxxx
```

