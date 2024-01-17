#!/usr/bin/env bash

ansible-playbook --ask-vault-pass --ask-become-pass -i inventory.ini deploy-playbook.yaml
