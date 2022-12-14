# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: smiro <smiro@student.42barcelona>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/11 15:23:29 by smiro             #+#    #+#              #
#    Updated: 2022/11/11 15:34:44 by smiro            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	fractol

SRCS		=	src/fractol.c src/utils.c src/keyboard_hook.c src/init.c  src/hooks.c \
				src/draw.c src/mouse_hook.c src/fractals/mandelbrot.c src/fractals/julia.c \
				src/fractals/burning_ship.c src/fractals/mandelbar.c src/fractals/perpendicular_mandelbrot.c \
				src/fractals/celtic_mandelbrot.c src/fractals/celtic_mandelbar.c src/fractals/perpendicular_celtic.c \
				src/fractals/heart.c src/fractals/buffalo.c src/draw_controls.c

OBJS		=	$(SRCS:.c=.o)

Lib_DIR		=	includes/libft
Lib			=	$(Lib_DIR)/libft.a
Printf_DIR	=	includes/printf
Printf		=	$(Printf_DIR)/libftprintf.a
Fract_Libs	=	includes/fractol.h includes/defines.h

RM			=	rm -f
CFLAGS		=	-Wall -Wextra -Werror -O3 -I /includes/.

%.o: %.c
	@$(CC) $(CFLAGS) -Imlx -c $< -o $@

all:
	@$(MAKE) -sC $(Lib_DIR)
	@$(MAKE) -sC $(Printf_DIR)
	@$(MAKE) $(NAME)

$(NAME):	$(OBJS) $(Fract_Libs)
	@$(CC) $(OBJS) -lpthread -Lmlx -lmlx $(Lib) $(Printf) -framework OpenGL -framework AppKit -o $(NAME)

clean:
	@$(MAKE) fclean -sC $(Lib_DIR)
	@$(MAKE) fclean -sC $(Printf_DIR)
	@$(RM) $(OBJS)
	
fclean:
	@$(MAKE) clean
	@$(RM) $(NAME)
	
re:
	@$(MAKE) fclean
	@$(MAKE)

.PHONY: all clean fclean re
