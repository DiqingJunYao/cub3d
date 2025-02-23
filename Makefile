# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dyao <dyao@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/21 12:14:45 by ckonneck          #+#    #+#              #
#    Updated: 2025/01/04 14:21:24 by dyao             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# Source files for cub3d
cub3d_SRCS =	main.c \
				parsing/textureparsing.c \
				parsing/floodfill.c \
				parsing/colorparsing.c \
				parsing/parsing2.c \
				parsing/parsing3.c \
				parsing/parsing.c \
				parsing/free.c \
				parsing/free2.c \
				parsing/mapchecks.c \
				parsing/utils.c \
				rendering/keyhandling.c \
				rendering/raycasting.c \
				rendering/rendering.c \
				rendering/mousehanding.c \
				rendering/wasd.c \
				rendering/gun.c \
				rendering/ft_draw_wall.c \
				rendering/render3D.c \
				rendering/wasd_2.c
cub3d_OBJS = $(cub3d_SRCS:.c=.o)
cub3d_DEPS = $(cub3d_SRCS:.c=.d)
CC = cc -g
LIBFT_DIR = ./libft
LIBS = -L$(LIBFT_DIR) -lft -Lminilibx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz
CFLAGS = -Wall -Wextra -Werror -I$(LIBFT_DIR) -Imlx_linux
NAME = cub3d
GREEN			= \033[0;92m
COLOR			= \033[0m

SUCCES			= @echo "$(GREEN)cub3d compiled successfully$(COLOR)"
all: $(NAME)

$(NAME): $(cub3d_OBJS)
	@$(MAKE) -C $(LIBFT_DIR)
	@$(CC) $(CFLAGS) $(cub3d_OBJS) $(LIBS) -o $(NAME) -lreadline
	@$(SUCCES)

%.o: %.c
	@$(CC) $(CFLAGS) -O3 -MMD -c $< -o $@

-include $(cub3d_DEPS)

clean:
	@$(MAKE) -C $(LIBFT_DIR) clean
	@rm -f $(cub3d_OBJS) $(cub3d_DEPS)


fclean: clean
	@$(MAKE) -C $(LIBFT_DIR) fclean
	@rm -f $(NAME)


re: fclean all

# valgrind rule
valgrind: $(NAME)
		valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(NAME) $(ARGS)
helgrind: $(NAME)
		valgrind --tool=helgrind --history-level=full ./$(NAME) $(ARGS)
# extra options: --verbose --log-file=valgrind-out.txt
#norminette rule
norminette: $(cub3d_SRCS)
		norminette $(cub3d_SRCS) cub3d.h

# Declare phony targets
.PHONY: all libft clean fclean re valgrind norminette