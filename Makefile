NAME =	.tester.tester_s

CALL_TESTER	=	./rsc/script/test.sh 

CALL_C_SOURCE	=	make -s -C src/C


all:		${NAME}

${NAME}:
		@${CALL_C_SOURCE}

test:
		@${CALL_TESTER}

clean:
		@${CALL_C_SOURCE} clean

fclean:		clean
		@${CALL_C_SOURCE} fclean

re:			fclean all

.PHONY:		all clean fclean re bonus
