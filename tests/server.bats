#!/usr/bin/env bats

setup() {
  sudo cp tests/authorized_keys ~/.ssh/authorized_keys
}

@test "install docksal" {
  ansible-playbook --connection=local -i local, tests/test_instance.yml --tags install
}

@test "Check docksal.env file " {
  cd /home/andock
  run stat .docksal/docksal.env
  [ $status = 0 ]
}

@test "Check stacks folder" {
  cd /home/andock
  run stat .docksal/stacks
  [ $status = 0 ]
}

@test "Check authorized_keys file" {
  cd /home/andock
  run stat .ssh/authorized_keys
  [ $status = 0 ]
}

@test "Check fin version" {
  cd /home/andock
  run sudo su andock -c 'fin version'
  [ $status = 0 ]
}


@test "update docksal" {
  ansible-playbook --connection=local -i local, tests/test_instance.yml --tags update
  cd /home/andock
  run sudo su andock -c 'fin version'
  [ $status = 0 ]
}
