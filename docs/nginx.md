Role: nginx
===========

Excerpt
-------

- install nginx package
- create shared directory for nginx
- copy shared files
- copy common configuration file
- copy applicaion configuration files
- start nginx service


Files
-----

- `/files/nginx/shared/*`: files to be copied to `{{ app.path }}/shared/nginx`
- `/templates/nginx/conf.d/*.conf`: applicaion configuration files


Dependencies
------------

- app
- user

