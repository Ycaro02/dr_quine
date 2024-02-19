#!/bin/bash

# Color definition
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"

BIN_NAME=test_diff

TMP_OUT=.tmp_output

GRACE_C_OUTPUT=src/Grace/C/Grace_kid.c

GRACE_C=src/Grace/C/Grace.c

COLLEEN_C=src/Colleen/C/Colleen.c

clang -Wall -Wextra -Werror -o Colleen ${COLLEEN_C}; ./Colleen > ${TMP_OUT} ; diff ${TMP_OUT} ${COLLEEN_C} && echo -e "${YELLOW}${COLLEEN_C} ${RESET}${GREEN}OK${RESET}"

clang -Wall -Wextra -Werror -o Grace ${GRACE_C}; ./Grace ; diff ${GRACE_C} Grace_kid.c  && echo -e "${YELLOW}${GRACE_C}${RES_COLOR}\t${GREEN}OK${RES_COLOR}"

rm ${TMP_OUT} Colleen Grace_kid.c Grace;