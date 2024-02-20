# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nfour <<marvin@42.fr>>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 16:33:38 by nfour             #+#    #+#              #
#    Updated: 2024/02/20 11:21:14 by nfour            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# nasm -f elf64 -o Coleen.o Coleen.s && gcc -Wall -Wextra -Werror -g Coleen.o

NASM	= 	nasm -f elf64 -g -o 

COLLEEN_NAME=Colleen
GRACE_NAME=Grace
SULLY_NAME=Sully

COLLEEN_SRC=Colleen.s
GRACE_SRC=Grace.s
SULLY_SRC=Sully.s

COLLEEN_OBJ=Colleen.o
GRACE_OBJ=Grace.o
SULLY_OBJ=Sully.o

CLEAR_SULLY = ./clear_sully.sh
GRACE_OUT = Grace_kid.s

RM	= rm -f

all:		${COLLEEN_NAME} ${GRACE_NAME} ${SULLY_NAME}

$(COLLEEN_OBJ): $(COLLEEN_SRC)
	@$(NASM) $@ $<

$(GRACE_OBJ): $(GRACE_SRC)
	@$(NASM) $@ $<

$(SULLY_OBJ): $(SULLY_SRC)
	@$(NASM) $@ $<

${COLLEEN_NAME}	:	$(COLLEEN_OBJ)
			@echo "\033[6;36m -----\tCompiling ${COLLEEN_NAME} ASM  ----- \033[0m"
			@gcc -Wall -Wextra -Werror -g -o $(COLLEEN_NAME) $(COLLEEN_OBJ)
			@echo "\033[6;32m -----\tCompiling ${COLLEEN_NAME} ASM ----- \033[0m"

${GRACE_NAME}	:	$(GRACE_OBJ)
			@echo "\033[6;36m -----\tCompiling ${GRACE_NAME}        ----- \033[0m"
			@gcc -Wall -Wextra -Werror -g -o $(GRACE_NAME) $(GRACE_OBJ)
			@echo "\033[6;32m -----\tCompiling ${GRACE_NAME} done   ----- \033[0m"

${SULLY_NAME}	:	$(SULLY_OBJ)
			@echo "\033[6;36m -----\tCompiling ${SULLY_NAME}        ----- \033[0m"
			@gcc -Wall -Wextra -Werror -g -o $(SULLY_NAME) $(SULLY_OBJ)
			@echo "\033[6;32m -----\tCompiling ${SULLY_NAME} done   ----- \033[0m"

clean:
			@echo "\033[6;31m -----\tCleaning  ${COLLEEN_NAME} ASM  ----- \033[0m"
			@echo "\033[6;31m -----\tCleaning  ${GRACE_NAME} obj    ----- \033[0m"
			@echo "\033[6;31m -----\tCleaning  ${SULLY_NAME} obj    ----- \033[0m"
			@${RM} $(COLLEEN_OBJ) ${GRACE_OBJ} ${SULLY_OBJ} ${GRACE_OUT}

fclean:		clean
			@echo "\033[6;33m -----\tCleaning  ${COLLEEN_NAME} ASM  ----- \033[0m"
			@echo "\033[6;33m -----\tCleaning  ${GRACE_NAME} done   ----- \033[0m"
			@echo "\033[6;33m -----\tCleaning  ${SULLY_NAME} done   ----- \033[0m"
			@${RM} ${COLLEEN_NAME} ${GRACE_NAME} ${SULLY_NAME}
			@${CLEAR_SULLY} s
			@${CLEAR_SULLY} o

re:			fclean all

.PHONY:		all clean fclean re bonus