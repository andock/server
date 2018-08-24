#!/usr/bin/env bats
setup() {
  sudo cp tests/authorized_keys ~/.ssh/authorized_keys
}

@test "install" {
  ansible-playbook --connection=local -i local, tests/test_instance.yml --tags install
  cd /home/andock
  run stat .docksal/docksal.env
  run stat .docksal/stacks
  run stat .ssh/authorized_keys
  sudo su andock -c 'fin version'

  [ $status = 0 ]

}

@test "update" {
  ansible-playbook --connection=local -i local, tests/test_instance.yml --tags update
  cd /home/andock
  sudo su andock -c 'fin version'
  [ $status = 0 ]
}
