#!/bin/bash
#./bin/acs ssh-add "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDG3lIf8MCPBFrOR2UaVMGfrfkP61GqOJRydMoqrJBvC2fQDXFUuVJ1HcSr4UtYpYGcGcaShJk4hE0JhvSdq/mzchbRuOxK1nV2prr/2fLRetpFxKteH/jYdcOeg1Iv53WX3KxUdE0pfTDsMVlSkZK3a47/gRgXUk5/o/L5M4QLsFeD7G6pQEDfVWJEO+mrcIuO6k21qhyH+1+WC4G0tdvEzhQVkmkZx7RLKAIjU0uJ+NJS7tLE8E0y/b/fle+kxwpNGl9Fl9Xtex9ZgC8n9syHq8K+B7YsiagUR5TsI0iYQV1kBRrcqyoH/uCaCWYIUabIlpkp9j+8Itrinjs29ItD cw@cw-sony-s"
ssh-keygen -R "192.168.33.10"
cd ..
ansible-playbook -i tests/inventory-$1 tests/test_instance.yml --tags install
ansible-playbook -i tests/inventory-$1 tests/test_instance.yml --tags update