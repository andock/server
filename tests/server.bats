#!/usr/bin/env bats


@test "install docksal" {
  sudo cp tests/authorized_keys ~/.ssh/authorized_keys
  export ANSIBLE_SSH_PIPELINING=True
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
  run sudo stat .ssh/authorized_keys
  [ $status = 0 ]
}

@test "Check fin version" {
  cd /home/andock
  run sudo su andock -c 'fin version'
  [ $status = 0 ]
}


@test "update docksal" {
  skip "Skip update for now ..."
  ansible-playbook --connection=local -i local, tests/test_instance.yml --tags update
  cd /home/andock
  run sudo su andock -c 'fin version'
  [ $status = 0 ]
}

teardown() {
    echo "Status: $status"
    echo "Output:"
    echo "================================================================"
    for line in "${lines[@]}"; do
        echo $line
    done
    echo "================================================================"
}