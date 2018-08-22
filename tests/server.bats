#!/usr/bin/env bats
setup() {
  sudo cp authorized_keys ~/.ssh/authorized_keys
}

@test "install" {
  ansible-playbook --connection=local -i local, test_instance.yml --tags install
  sudo ls /home/andock/.ssh/authorized_keys
  sudo cp -R ../../server /home/andock
  sudo ls /home/andock/.docksal/docksal.env
}

@test "install_docksal" {
  cd /home/andock/server/tests
  sudo su andock -c 'ansible-playbook --connection=local -e "ansible_sudo_pass=andock" -i local, test_instance.yml --tags install_docksal'
  sudo su andock -c 'fin version'
}

@test "update" {
  ansible-playbook --connection=local -i local, test_instance.yml --tags update
}

@test "update_docksal" {
  sudo su andock -c 'ansible-playbook --connection=local -e "ansible_sudo_pass=andock" -i local, test_instance.yml --tags update_docksal'
  sudo su andock -c 'fin version'
}
