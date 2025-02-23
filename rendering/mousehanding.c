/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   mousehanding.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dyao <dyao@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/12/20 18:47:06 by dyao              #+#    #+#             */
/*   Updated: 2025/01/04 14:44:34 by dyao             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../cub3d.h"

int	mouse_press(int button, t_data *data)
{
	if (button == 1)
		data->fire = 1;
	return (0);
}

int	mouse_release(int button, t_data *data)
{
	if (button == 1)
		data->fire = 0;
	return (0);
}

int	mousemovement(int x, int y, t_data *data)
{
	if (x > 1920)
		x = 1920;
	if (y < 0)
		y = 0;
	if (x < 900)
		data->look_left = 1;
	else if (x > 1020)
		data->look_right = 1;
	else
	{
		data->look_left = 0;
		data->look_right = 0;
	}
	return (0);
}

//this function works best but not with norminette
// int	mousemovement(int button, int x, int y, t_data *data)
// {
// 	if (button == 3 && data->fire == 0)
// 		data->fire = 1;
// 	else if (button == 3 && data->fire == 1)
// 		data->fire = 0;
// 	while (1)
// 	{
// 		mlx_mouse_get_pos(data->mlx, data->win, &x, &y);
// 		if (x > 1920)
// 			x = 1920;
// 		else if (x < 0)
// 			x = 0;
// 		if (x < 930)
// 		{
// 			data->a += (x - 960) * 0.04;
// 			redraw_map(data);
// 		}
// 		else if (x > 990)
// 		{
// 			data->a += (x - 960) * 0.04;
// 			redraw_map(data);
// 		}
// 		else
// 			break ;
// 	}
// 	redraw_map(data);
// 	return (0);
// }

// int	mousemovement(t_data *data)
// {
// 	int x;
// 	int y;
// 	mlx_mouse_get_pos(data->mlx, data->win, &x, &y);
// 	// printf("this is x: %d, this is y: %d\n", x, y);
// 	if (x > 1920)
// 		x = 1920;
// 	else if (x < 0)
// 		x = 0;
// 	if (x < 930)
// 	{
// 		data->a += (x - 960) * 0.04;
// 		redraw_map(data);
// 	}
// 	else if (x > 990)
// 	{
// 		data->a += (x - 960) * 0.04;
// 		redraw_map(data);
// 	}
// 	else
// 		return (0);

// 	return (0);
// }
