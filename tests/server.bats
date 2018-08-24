#!/usr/bin/env bats
setup() {
  sudo cp tests/authorized_keys ~/.ssh/authorized_keys
}

@test "install" {
  sudo ansible-playbook --connection=local -i local, tests/test_instance.yml --tags install
  sudo ls /home/andock/.docksal/docksal.env
  sudo ls /home/andock/.ssh/authorized_keys
  sudo su andock -c 'fin version'

}

@test "update" {
  cd /home/andock/server
  sudo su andock -c 'ansible-playbook --connection=local -i local, tests/test_instance.yml --tags update'
  sudo su andock -c 'fin version'
}
