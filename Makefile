NAME =	.tester.tester_s

CALL_TESTER	=	./rsc/script/test.sh 

CALL_COLLEEN	=	make -s -C src/Colleen/C

all:		${NAME}

${NAME}:
		@${CALL_COLLEEN}
		@${CALL_TESTER} src/Colleen/C/Colleen.c

clean:
		@${CALL_COLLEEN} clean

fclean:		clean
		@${CALL_COLLEEN} fclean

re:			fclean all

.PHONY:		all clean fclean re bonus
