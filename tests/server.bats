#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

setup() {
  sudo cp tests/authorized_keys ~/.ssh/authorized_keys
}

@test "install" {
  run ansible-playbook --connection=local -i local, tests/test_instance.yml --tags install
  [ $status = 0 ]
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


@test "update" {
  ansible-playbook --connection=local -i local, tests/test_instance.yml --tags update
  cd /home/andock
  run sudo su andock -c 'fin version'
  [ $status = 0 ]
}
