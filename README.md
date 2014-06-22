Ansible roles
=============

Common role collection for web application


How to use
----------

### 1. Get as submodule

```sh
$ git submodule add git@github.com:creasty/ansible-roles.git common
```

If you prefer use local clone, symbolic link will do.

```sh
$ ln -s ~/somewhere/the/repository/exists common
```


### 2. Set assets_path in your playbook file

```yaml
- name:  setup example production server
  hosts: example_production
  sudo:  true

  vars:
    common_path:      ../../common
    assets_path:      ../roles/example_production
    loop_assets_path: ../example_production

  # ...
```

### 3. Include common roles in a main task file

```yaml
- include: '{{ common_path }}/common.yml'
- include: '{{ common_path }}/ntp.yml'
- include: '{{ common_path }}/user.yml'
- include: '{{ common_path }}/app.yml'
# ...
```


Special thanks
--------------

These repositories have heavily inspired me.

- https://github.com/bojovs/annict-playbooks
- https://github.com/iktakahiro/ansible_playbooks

