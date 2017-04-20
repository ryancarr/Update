#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

BORDER=${GREEN}
INSIDE=${CYAN}

clear
echo -e "${BORDER}******************************\n* ${INSIDE}Beginning update procedure${BORDER} *\n******************************\n${NC}" | tee output.log
apt-get update | tee output.log -a
echo -e "\n" | tee output.log -a
clear
echo -e "${BORDER}********************\n* ${INSIDE}Upgrading Distro${BORDER} *\n********************\n${NC}" | tee output.log -a
apt-get dist-upgrade -y | tee output.log -a
echo -e "\n" | tee output.log -a
clear
echo -e "${BORDER}*********************************\n* ${INSIDE}Removing unnecessary packages${BORDER} *\n*********************************\n${NC}" | tee output.log -a
apt-get autoremove -y | tee output.log -a
echo -e "\n" | tee output.log -a
clear
echo -e "${BORDER}****************************\n* ${INSIDE}Cleaning up package list${BORDER} *\n****************************\n${NC}" | tee output.log -a
apt-get autoclean -y | tee output.log -a
echo -e "\n" | tee output.log -a
clear
cat output.log
