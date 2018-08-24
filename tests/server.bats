#!/usr/bin/env bats
setup() {
  sudo cp tests/authorized_keys ~/.ssh/authorized_keys
}

@test "install" {
  ansible-playbook --connection=local -i local, tests/test_instance.yml --tags install
  cd /home/andock
  sudo ls .docksal/docksal.env
  sudo ls .docksal/stacks
  sudo ls .ssh/authorized_keys
  sudo su andock -c 'fin version'

}

@test "update" {
  cd /home/andock
  ansible-playbook --connection=local -i local, tests/test_instance.yml --tags update
  sudo su andock -c 'fin version'
}
