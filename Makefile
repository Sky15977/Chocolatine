##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## compiles mylib
##

CC 	=	gcc

SRC_MAIN	=	main.c

SRC	=

SRC_CRIT	=

OBJ	=	$(SRC:.c=.o) $(SRC_MAIN:.c=.o)

OBJ_CRIT	=	$(SRC:.c=.o) $(SRC_CRIT:.c=.o)

NAME	= 	chocolatine

NAME_CRIT	=	unit_tests

INCLUDES        =       -I includes/

CFLAGS	=	$(INCLUDES) -Wall -Wextra -g

CRIT_F	=	$(INCLUDES) --coverage -lcriterion

all:	$(NAME)

$(NAME):	$(OBJ)
		@$(CC) -o $(NAME) $(OBJ) $(CFLAGS)
		@echo -e "\033[1;32mCompilation done\033[0m"

%.o:	%.c
	@$(CC) $(CFLAGS) -c $< -o $@

unit_tests:
	@$(CC) -o $(NAME_CRIT) $(OBJ) $(OBJ_CRIT) $(CRIT_F)
	@./$(NAME_CRIT)
	@gcovr

clean:
	@rm -f $(OBJ)
	@find . \( -name "*~" -o -name "#*" -o -name "*#" \) -delete
	@echo -e "\033[1;31mClean done\033[0m"

fclean:	clean
	@rm -f $(NAME)
	@rm -f $(NAME_CRIT)
	@rm -f coding-style-reports.log
	@rm -f vgcore*
	@echo -e "\033[1;31mFclean done\033[0m"

re:	fclean all

.PHONY: 	all re clean fclean
