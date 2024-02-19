# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nfour <<marvin@42.fr>>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 16:33:38 by nfour             #+#    #+#              #
#    Updated: 2024/02/17 13:45:00 by nfour            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS	=	Colleen.s

NASM	= 	nasm -f elf64 -o

NAME	= 	Colleen

# nasm -f elf64 -o Coleen.o Coleen.s && gcc -Wall -Wextra -Werror -g Coleen.o

CC		= 

# LINK	= ld -o -z noexecsstack

OBJS = $(SRCS:.s=.o)

RM	= rm -f

all:		${NAME}

#nasm -f elf64 -o test.o test.s &&  ld -o test test.o && ./test

%.o : %.s
			@$(NASM) $@ $<

${NAME}:	$(OBJS)
			@ echo "\033[7;36m ----- Compiling ASM ${NAME} bin    ----- \033[0m"
			@gcc -Wall -Wextra -Werror -g -o $(NAME) $(OBJS)
			@echo "\033[7;32m ----- Compiling ASM ${NAME} done   ----- \033[0m"


clean:
			@echo "\033[7;31m\n ----- Cleaning  ASM ${NAME} obj    ----- \033[0m"
			@${RM} ${OBJS}
			@echo "\033[7;33m ----- Cleaning  ASM ${NAME} done   ----- \033[0m"

fclean:		clean
			@${RM} ${NAME}

re:			fclean all

.PHONY:		all clean fclean re bonus
