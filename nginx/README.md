Role: nginx
===========

Excerpt
-------

- install nginx package
- create shared directory for nginx
- copy common configuration file
- copy applicaion configuration files
- start nginx service


Configuration
-------------

```javascript
{
  "nginx": {
    "application": ["virtual_host_1"]
  }
}
```


Dependencies
------------

- app
- user

