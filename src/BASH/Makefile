CC		= gcc

CFLAGS	= -Wall -Wextra -Werror -g3

COLLEEN_NAME=Colleen
COLLEEN_OUT=Collen_bash_out
GRACE_NAME=Grace
SULLY_NAME=Sully

COLLEEN_SRC=Colleen.sh
GRACE_SRC=Grace.sh
SULLY_SRC=Sully.sh

CLEAR_SULLY = ../../rsc/script/clear_sully.sh
GRACE_OUT = Grace_kid.sh

RM	= rm -rf

all:		${COLLEEN_NAME} ${GRACE_NAME} ${SULLY_NAME}

${COLLEEN_NAME}	:
			@echo "\033[6;36m -----\t Launch ${COLLEEN_SRC}      ----- \033[0m"
			@./${COLLEEN_SRC} > ${COLLEEN_OUT}
${GRACE_NAME}	:
			@echo "\033[6;36m -----\t Launch ${GRACE_SRC}        ----- \033[0m"
			@./${GRACE_SRC}
${SULLY_NAME}	:
			@echo "\033[6;36m -----\t Launch ${SULLY_SRC}        ----- \033[0m"
			@./${SULLY_SRC}
clean:
			@echo "\033[6;31m -----\tCleaning  ${COLLEEN_NAME} obj  ----- \033[0m"
			@${RM} ${COLLEEN_OUT} ${GRACE_OUT}
fclean:		clean
			@${CLEAR_SULLY} 
re:			fclean all

.PHONY:		all clean fclean re bonus