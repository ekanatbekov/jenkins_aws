#!/bin/bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

if ! command -v terraform >/dev/null 2>&1; then
  echo -e "${RED}terraform is not installed.${NC}"
  exit 1
fi

echo -e "${GREEN}Choose an action:${NC}"
echo "1) Create Jenkins server"
echo "2) Destroy Jenkins server"
read -r ACTION

terraform fmt -recursive
terraform init

case "$ACTION" in
  1)
    terraform validate
    terraform apply -auto-approve
    ;;
  2)
    terraform destroy -auto-approve
    ;;
  *)
    echo -e "${YELLOW}Invalid option. Use 1 or 2.${NC}"
    exit 1
    ;;
esac
