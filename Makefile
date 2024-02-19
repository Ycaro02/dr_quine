NAME =	.tester.tester_s

CALL_TESTER	=	./rsc/script/test.sh 

CALL_C_SOURCE	=	make -s -C src/C

CALL_ASM_SOURCE = make -s -C src/ASM


all:		${NAME}

${NAME}:
		@${CALL_C_SOURCE}
		@${CALL_ASM_SOURCE}

test:
		@${CALL_TESTER}

clean:
		@${CALL_C_SOURCE} clean
		@${CALL_ASM_SOURCE} clean

fclean:		clean
		@${CALL_C_SOURCE} fclean
		@${CALL_ASM_SOURCE} fclean

re:			fclean all

.PHONY:		all clean fclean re bonus
