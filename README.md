andock server.
=========

**andock.server** is a Ansible role which:
* Install docksal
* Update docksal
* Configure docksal to listen on 0.0.0.0 
* Add thin acs (andock server) 
  
**The livecycle can be controlled with tags**
* install
* update


Requirements
------------

In order to build your apps with Andock CI, you will need:

* Ansible in your deploy machine
* Docksal



Installation
------------

Andock is an Ansible role distributed globally using [Ansible Galaxy](https://galaxy.ansible.com/). In order to install andock role you can use the following command.

```
$ ansible-galaxy install andock.fin
```

Update
------

If you want to update the role, you need to pass **--force** parameter when installing. Please, check the following command:

```
$ ansible-galaxy install --force andock.fin
```


License
-------

BSD

Author Information
------------------

Christian Wiedemann (christian.wiedemann@key-tec.de)
