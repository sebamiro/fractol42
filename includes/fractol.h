/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   fractol.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smiro <smiro@student.42barcelona>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/13 17:24:08 by smiro             #+#    #+#             */
/*   Updated: 2022/11/13 17:24:13 by smiro            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FRACTOL_H
# define FRACTOL_H

#include "defines.h"

t_complex	init_complex(double x, double y);

t_fractol	*init_window(void *mlx, char *set);

int	close_program(t_fractol *vars);

int	key_hook(int key, t_fractol *vars);

int	zoom(int key, int x, int y, t_fractol *fractol);

void	move(int key, t_fractol *fractol);

void	draw(t_fractol *fractol);

void	zoom_color(int	color, t_fractol *fractol, int i);

//fractal sets

int	mandelbrot(t_fractol *fractol);

int	julia(t_fractol *fractol);

int	burning_ship(t_fractol *fractol);

//utils

float	ft_atof(char *n);

void	ft_check(int ac, char **av);

#endif