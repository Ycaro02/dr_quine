NAME =	.tester.tester_s

CALL_TESTER	=	./rsc/script/test.sh 

CALL_COLLEEN	=	make -s -C src/Colleen/C

CALL_GRACE		=	make -s -C src/Grace/C

GRACE_OUTPUT	= src/Grace/C/Grace_kid.c

GRACE_C			= src/Grace/C/Grace.c

RES_COLOR		= \033[0m

START_COLOR		= \033[6;3

all:		${NAME}

${NAME}:
		@${CALL_COLLEEN}
		@${CALL_GRACE}
		@${CALL_TESTER} src/Colleen/C/Colleen.c
		@diff ${GRACE_OUTPUT} ${GRACE_C} && echo "${START_COLOR}3m${GRACE_C}${RES_COLOR}\t${START_COLOR}2mOK${RES_COLOR}"
clean:
		@${CALL_COLLEEN} clean
		@${CALL_GRACE} clean

fclean:		clean
		@${CALL_COLLEEN} fclean
		@${CALL_GRACE} fclean

re:			fclean all

.PHONY:		all clean fclean re bonus
