#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

BORDER=${GREEN}
INSIDE=${CYAN}
OUTPUT='output.log'

clear
echo -e "${BORDER}******************************\n* ${INSIDE}Beginning update procedure${BORDER} *\n******************************\n${NC}" | tee ${OUTPUT}
apt-get update | tee ${OUTPUT} -a
echo -e "\n" | tee ${OUTPUT} -a
clear
echo -e "${BORDER}********************\n* ${INSIDE}Upgrading Distro${BORDER} *\n********************\n${NC}" | tee ${OUTPUT} -a
apt-get dist-upgrade -y | tee ${OUTPUT} -a
echo -e "\n" | tee ${OUTPUT} -a
clear
echo -e "${BORDER}*********************************\n* ${INSIDE}Removing unnecessary packages${BORDER} *\n*********************************\n${NC}" | tee ${OUTPUT} -a
apt-get autoremove -y | tee ${OUTPUT} -a
echo -e "\n" | tee ${OUTPUT} -a
clear
echo -e "${BORDER}****************************\n* ${INSIDE}Cleaning up package list${BORDER} *\n****************************\n${NC}" | tee ${OUTPUT} -a
apt-get autoclean -y | tee ${OUTPUT} -a
echo -e "\n" | tee ${OUTPUT} -a
clear
cat ${OUTPUT}
