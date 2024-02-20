#!/bin/bash

# Color definition
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"
# COLLEEN QUINE
COLLEEN_C=src/C/Colleen.c
COLLEEN_ASM=src/ASM/Colleen.s
COLLEEN_OUT=COLEEN_output
# GRACE QUINE
GRACE_C=src/C/Grace.c
GRACE_C_OUTPUT=Grace_kid.c
GRACE_ASM=src/ASM/Grace.s
GRACE_ASM_OUTPUT=Grace_kid.s

# SHULLY QUINE
SULLY_C=src/C/Sully.c
# SULLY_CLEAR=src/C/clear_sully.sh
SULLY_ASM=src/ASM/Sully.s
SULLY_CLEAR=src/ASM/clear_sully.sh

SULLY_ASM_OUT=Sully_5.s
SULLY_C_OUT=Sully_5.c

CALL_ASM_DIR="make -s -C src/ASM"
CLANG_CC="clang -Wall -Wextra -Werror"

diff_file () {
	# echo  "1 |$1| 2 |$2|" 
	diff $1 $2 
	if [ $? -eq 0 ] ; then
		echo -e "${YELLOW}${1} ${RESET}${GREEN}OK${RESET}"
	else
		echo -e "${YELLOW}${1} ${RESET}${RED}KO${RESET}"
	fi
}

${CLANG_CC} -o Colleen ${COLLEEN_C}; ./Colleen > ${COLLEEN_OUT};
diff_file ${COLLEEN_C} ${COLLEEN_OUT} 
${CLANG_CC} -o Grace ${GRACE_C}; ./Grace ;
diff_file ${GRACE_C} ${GRACE_C_OUTPUT}
${CLANG_CC} -o Sully ${SULLY_C}; ./Sully ; 
diff_file ${SULLY_C} ${SULLY_C_OUT}
# Call ASM makefile
${CALL_ASM_DIR};
# test Colleen ASM version
./src/ASM/Colleen > ${COLLEEN_OUT};
diff_file ${COLLEEN_ASM} ${COLLEEN_OUT}
./src/ASM/Grace ;
diff_file ${GRACE_ASM_OUTPUT} ${GRACE_ASM}
./src/ASM/Sully ;
diff_file ${SULLY_ASM_OUT} ${SULLY_ASM}


COLLEEN_BASH=src/BASH/Colleen.sh
COLLEEN_BASH_OUT=Colleen_bash_out

./${COLLEEN_BASH} > ${COLLEEN_BASH_OUT} 
diff_file ${COLLEEN_BASH} ${COLLEEN_BASH_OUT}
rm ${COLLEEN_BASH_OUT}

./${SULLY_CLEAR} c
./${SULLY_CLEAR} o
./${SULLY_CLEAR} s
rm ${COLLEEN_OUT} Colleen Sully Grace ${GRACE_C_OUTPUT} ${GRACE_ASM_OUTPUT};
${CALL_ASM_DIR} fclean