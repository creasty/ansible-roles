Role: git_deploy
================

Excerpt
-------

- create shared repository directory
- create current directory
- initialize shared repository
- copy post-receive hook


Configuration
-------------

```yaml
git_deploy:
  branch: master
  script: xxxx.sh
```


Dependencies
------------

- app
- user
