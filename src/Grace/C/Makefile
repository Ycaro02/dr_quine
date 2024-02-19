# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ycaro <ycaro@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 16:33:38 by nfour             #+#    #+#              #
#    Updated: 2024/02/18 17:57:48 by ycaro            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC		= gcc

CFLAGS	= -Wall -Wextra -Werror -g3

SRCS	=	Grace.c\

OBJS = $(SRCS:.c=.o)

RM	= rm -f

GRACE_OUT = Grace_kid.c

NAME	= 	Grace

all:		${NAME}

%.o : %.c
	@$(CC) ${CFLAGS} -c $< -o $@

${NAME}:	$(OBJS)
			@echo "\033[6;36m -----\tCompiling ${NAME}       ----- \033[0m"
			@$(CC) ${CFLAGS} -o $(NAME) $(OBJS)
			@echo "\033[6;32m -----\tCompiling ${NAME} done  ----- \033[0m"

test:		${NAME}
			@./${NAME}

clean:
			@echo "\033[6;31m -----\tCleaning  ${NAME} obj   ----- \033[0m"
			@${RM} ${OBJS}


fclean:		clean
			@echo "\033[6;33m -----\tCleaning  ${NAME} done  ----- \033[0m"
			@${RM} ${NAME}

re:			fclean all


.PHONY:		all clean fclean re bonus
