CC		= gcc

CFLAGS	= -Wall -Wextra -Werror -g3

COLLEEN_NAME=Colleen
GRACE_NAME=Grace
SULLY_NAME=Sully

COLLEEN_SRC=Colleen.c
GRACE_SRC=Grace.c
SULLY_SRC=Sully.c

COLLEEN_OBJ=Colleen.o
GRACE_OBJ=Grace.o
SULLY_OBJ=Sully.o

CLEAR_SULLY = ../../rsc/script/clear_sully.sh
GRACE_OUT = Grace_kid.c

RM	= rm -f

all:		${COLLEEN_NAME} ${GRACE_NAME} ${SULLY_NAME}

$(COLLEEN_OBJ): $(COLLEEN_SRC)
	@$(CC) ${CFLAGS} -c $< -o $@

$(GRACE_OBJ): $(GRACE_SRC)
	@$(CC) ${CFLAGS} -c $< -o $@

$(SULLY_OBJ): $(SULLY_SRC)
	@$(CC) ${CFLAGS} -c $< -o $@


${COLLEEN_NAME}	:	$(COLLEEN_OBJ)
			@echo "\033[3;36m -----\tCompiling ${COLLEEN_NAME}      ----- \033[0m"
			@$(CC) ${CFLAGS} -o $(COLLEEN_NAME) $(COLLEEN_OBJ)
			@echo "\033[3;32m -----\tCompiling ${COLLEEN_NAME} done ----- \033[0m"

${GRACE_NAME}	:	$(GRACE_OBJ)
			@echo "\033[3;36m -----\tCompiling ${GRACE_NAME}        ----- \033[0m"
			@$(CC) ${CFLAGS} -o $(GRACE_NAME) $(GRACE_OBJ)
			@echo "\033[3;32m -----\tCompiling ${GRACE_NAME} done   ----- \033[0m"

${SULLY_NAME}	:	$(SULLY_OBJ)
			@echo "\033[3;36m -----\tCompiling ${SULLY_NAME}        ----- \033[0m"
			@$(CC) ${CFLAGS} -o $(SULLY_NAME) $(SULLY_OBJ)
			@echo "\033[3;32m -----\tCompiling ${SULLY_NAME} done   ----- \033[0m"

clean:
			@echo "\033[3;31m -----\tCleaning  ${COLLEEN_NAME} obj  ----- \033[0m"
			@echo "\033[3;31m -----\tCleaning  ${GRACE_NAME} obj    ----- \033[0m"
			@echo "\033[3;31m -----\tCleaning  ${SULLY_NAME} obj    ----- \033[0m"
			@${RM} $(COLLEEN_OBJ) ${GRACE_OBJ} ${SULLY_OBJ} ${GRACE_OUT}

fclean:		clean
			@echo "\033[3;33m -----\tCleaning  ${COLLEEN_NAME} done ----- \033[0m"
			@echo "\033[3;33m -----\tCleaning  ${GRACE_NAME} done   ----- \033[0m"
			@echo "\033[3;33m -----\tCleaning  ${SULLY_NAME} done   ----- \033[0m"
			@${RM} ${COLLEEN_NAME} ${GRACE_NAME} ${SULLY_NAME} ${GRACE_OUT}
			@${CLEAR_SULLY} c
re:			fclean all

.PHONY:		all clean fclean re bonus