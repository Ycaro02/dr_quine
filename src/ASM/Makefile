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

OBJS = $(SRCS:.s=.o)

RM	= rm -f

all:		${NAME}

%.o : %.s
			@$(NASM) $@ $<

${NAME}:	$(OBJS)
			@ echo "\033[6;36m -----  Compiling ASM ${NAME}  ----- \033[0m"
			@gcc -Wall -Wextra -Werror -g -o $(NAME) $(OBJS)
			@echo "\033[6;32m -----  Compiling ASM ${NAME}  ----- \033[0m"


clean:
			@echo "\033[6;31m -----  Cleaning  ASM ${NAME}  ----- \033[0m"
			@${RM} $S}
			@echo "\033[6;33m -----  Cleaning  ASM ${NAME}  ----- \033[0m"

fclean:		clean
			@${RM} ${NAME}

re:			fclean all

.PHONY:		all clean fclean re bonus

