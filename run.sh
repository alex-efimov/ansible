#!/bin/bash

GROUP=""

[[ "$1" ]] && \
  GROUP="-l $1"

ansible-playbook -vvv \
  --ask-vault-pass\
  -i ./inventory/ ${GROUP}\
  ./site.yml
