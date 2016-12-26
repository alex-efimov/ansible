#!/bin/bash

GROUP="${1}"

if [[ ! -e "./inventory/${GROUP}" ]]; then
  echo "./inventory/${GROUP} not found"
  exit 1
fi

ansible-playbook -vvv \
  --ask-vault-pass\
  -i ./inventory/${GROUP}\
  ./site.yml
