#!/bin/bash

GROUP=""

[[ "$1" ]] && \
  GROUP="-l $1"
[[ "$2" ]] && \
  TAGS="--tags '$2'"

ansible-playbook -vvv \
  -e 'host_key_checking=False' \
  --ask-vault-pass\
  -i ./inventory/ ${GROUP} ${TAGS} \
  ./site.yml
