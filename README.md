andock server.
=========

**andock.server** is a Ansible role which:
* Create Andock user
* Install Docksal
* Update Docksal
* Configure Docksal to listen on 0.0.0.0 
* Add thin Andock server
  

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

GPL

Author Information
------------------

Christian Wiedemann (christian.wiedemann@key-tec.de)
