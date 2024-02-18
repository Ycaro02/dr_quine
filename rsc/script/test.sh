#!/bin/bash

BIN_NAME=test_diff

TMP_OUT=.tmp_output

# Color definition
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"

clang -Wall -Wextra -Werror -o ${BIN_NAME} ${1}; ./${BIN_NAME} > ${TMP_OUT} ; diff ${TMP_OUT} ${1} && echo -e "${YELLOW}${1} ${RESET}${GREEN}OK${RESET}"

rm ${TMP_OUT} ${BIN_NAME};