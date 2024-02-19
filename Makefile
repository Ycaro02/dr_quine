NAME =	.tester.tester_s

CALL_TESTER	=	./rsc/script/test.sh 

CALL_COLLEEN	=	make -s -C src/Colleen/C

CALL_GRACE		=	make -s -C src/Grace/C

all:		${NAME}

${NAME}:
		@${CALL_COLLEEN}
		@${CALL_GRACE}

test:
		@${CALL_TESTER}

clean:
		@${CALL_COLLEEN} clean
		@${CALL_GRACE} clean

fclean:		clean
		@${CALL_COLLEEN} fclean
		@${CALL_GRACE} fclean

re:			fclean all

.PHONY:		all clean fclean re bonus
