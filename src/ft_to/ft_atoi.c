/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dagomez <dagomez@student.42malaga.com>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/03 14:42:01 by dagomez           #+#    #+#             */
/*   Updated: 2022/05/18 14:52:18 by dagomez          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/* Combierte un string a entero */

#include "libft.h"

int	ft_atoi(const char *str)
{
	int	i;
	int	j;
	int	a;

	i = 0;
	j = 1;
	a = 0;
	while ((str[i] >= 9 && str[i] <= 13) || str[i] == 32)
		i++;
	if (str[i] == '-')
	{
		j *= -1;
	}
	if (str[i] == '-' || str[i] == '+')
		i++;
	while (str[i])
	{
		if (str[i] >= '0' && str[i] <= '9')
			a = (a * 10) + (str[i] - '0');
		else
			break ;
		i++;
	}
	return (a * j);
}
