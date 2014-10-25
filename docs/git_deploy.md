Role: git_deploy
================

Excerpt
-------

- create current directory
- create shared repository
- change permission of shared repository
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
