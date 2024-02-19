#!/bin/bash

# Color definition
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"


COLLEEN_C=src/C/Colleen.c
COLLEEN_ASM=src/ASM/Colleen.s
COLEEN_OUT=COLEEN_output

GRACE_C=src/C/Grace.c
GRACE_C_OUTPUT=Grace_kid.c

SULLY_C=src/C/Sully.c
SULLY_CLEAR=src/C/clear_sully.sh

CALL_ASM_DIR="make -s -C src/ASM"

clang -Wall -Wextra -Werror -o Colleen ${COLLEEN_C}; ./Colleen > ${COLEEN_OUT};
diff ${COLEEN_OUT} ${COLLEEN_C} 
if [ $? -eq 0 ] ; then
echo -e "${YELLOW}${COLLEEN_C}\t\t${RESET}${GREEN}OK${RESET}"
else
echo -e "${YELLOW}${COLLEEN_C}\t\t${RESET}${RED}KO${RESET}"
fi

clang -Wall -Wextra -Werror -o Grace ${GRACE_C}; ./Grace ;
diff ${GRACE_C} ${GRACE_C_OUTPUT}
if [ $? -eq 0 ] ; then
echo -e "${YELLOW}${GRACE_C}\t\t${RESET}${GREEN}OK${RESET}"
else
echo -e "${YELLOW}${GRACE_C}\t\t${RESET}${RED}KO${RESET}"
fi

clang -Wall -Wextra -Werror -o Sully ${SULLY_C}; ./Sully ; 
diff ${SULLY_C} Sully_5.c
if [ $? -eq 0 ] ; then
echo -e "${YELLOW}${SULLY_C}\t\t${RESET}${GREEN}OK${RESET}"
else
echo -e "${YELLOW}${SULLY_C}\t\t${RESET}${RED}KO${RESET}"
fi

${CALL_ASM_DIR} && ./src/ASM/Colleen > ${COLEEN_OUT};
diff ${COLEEN_OUT} ${COLLEEN_ASM}
if [ $? -eq 0 ] ; then
echo -e "${YELLOW}${COLLEEN_ASM}\t${RESET}${GREEN}OK${RESET}"
else
echo -e "${YELLOW}${COLLEEN_ASM}\t${RESET}${RED}KO${RESET}"
fi

./${SULLY_CLEAR}
rm ${COLEEN_OUT} Colleen Sully Grace Grace_kid.c;