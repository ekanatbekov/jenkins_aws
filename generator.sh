#!/bin/bash

cat ~/.ssh/id_rsa.pub 1> $PWD/keypair.txt

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGNETA='\033[0;35m'
CYAN='\033[0;36m'
ENDCOLOR="\e[0m"
Color_Off='\033[0m'




echo -e "${GREEN}Press 1 if you want to Create  Jenkins runner
Press 2 if you want to delete Jenkins runner${Color_Off}"
read NUMBER
if [[ $NUMBER -eq 1 ]]; then
  terraform init &&
  terraform apply --auto-approve
else
  terraform destroy --auto-approve
fi