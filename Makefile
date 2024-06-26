# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dagomez <dagomez@student.42malaga.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/20 17:51:10 by ngonzale          #+#    #+#              #
#    Updated: 2022/06/28 19:30:24 by dagomez          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		:= libft.a

SRC_DIR		:= src
OBJ_DIR		:= obj

IS_DIR		:= ft_is
IS_NAMES	:= ft_isalnum ft_isalpha ft_isascii ft_isdigit ft_isprint
IS_FILES	:= $(addprefix $(IS_DIR)/, $(IS_NAMES)) 

LST_DIR		:= ft_lst
LST_NAMES	:= ft_lstadd_back ft_lstadd_front ft_lstclear ft_lstdelone \
			   ft_lstiter ft_lstlast ft_lstmap ft_lstnew ft_lstsize			   
LST_FILES	:= $(addprefix $(LST_DIR)/, $(LST_NAMES)) 

MEM_DIR		:= ft_mem
MEM_NAMES	:= ft_bzero ft_calloc ft_memchr ft_memcpy ft_memcmp \
		  	   ft_memmove ft_memset
MEM_FILES	:= $(addprefix $(MEM_DIR)/, $(MEM_NAMES)) 

PUT_DIR		:= ft_put
PUT_NAMES	:= ft_putchar_fd ft_putendl_fd ft_putnbr_fd ft_putstr_fd
PUT_FILES	:= $(addprefix $(PUT_DIR)/, $(PUT_NAMES)) 

STR_DIR		:= ft_str
STR_NAMES	:= ft_split ft_strchr ft_strdup ft_striteri ft_strjoin \
		  	   ft_strlcat ft_strlcpy ft_strlen ft_strmapi ft_strncmp \
			   ft_strnstr ft_strrchr ft_strtrim ft_substr
STR_FILES	:= $(addprefix $(STR_DIR)/, $(STR_NAMES)) 

TO_DIR		:= ft_to
TO_NAMES	:= ft_atoi ft_itoa ft_tolower ft_toupper 
TO_FILES	:= $(addprefix $(TO_DIR)/, $(TO_NAMES))

FT_PRINTF_DIR	:= ft_printf
FT_PRINTF_NAMES	:= ft_printf ft_printf_types ft_printf_types_1 ft_printf_utils
FT_PRINTF_FILES	:= $(addprefix $(FT_PRINTF_DIR)/, $(FT_PRINTF_NAMES)) 

GNL_DIR		:= ft_gnl
GNL_NAMES	:= get_next_line get_next_line_utils
GNL_FILES	:= $(addprefix $(GNL_DIR)/, $(GNL_NAMES)) 

SRCS		:= $(addsuffix .c, $(addprefix $(SRC_DIR)/, $(IS_FILES) \
	$(LST_FILES) $(MEM_FILES) $(PUT_FILES) $(STR_FILES) $(TO_FILES) \
	$(FT_PRINTF_FILES) $(GNL_FILES))) \

OBJS		:= $(addsuffix .o, $(addprefix $(OBJ_DIR)/, $(IS_FILES) \
	$(LST_FILES) $(MEM_FILES) $(PUT_FILES) $(STR_FILES) $(TO_FILES) \
	$(FT_PRINTF_FILES) $(GNL_FILES))) \

SRCS_NUM	:= $(words $(SRCS))
OBJS_CREATED:= $(shell if [ -d $(OBJ_DIR) ]; then ls -l $(OBJ_DIR)/* | grep -c "\.o"; else echo 0; fi)

CC			:= gcc

CFLAGS		:= -Wall -Wextra -Werror

INCLUDE		:= -I .

AR			:= ar rcs

RM			:= rm -f

all:		$(NAME)

clean:
	@echo "Removing objects..."
	@$(RM) $(OBJS)
	@$(RM) -r $(OBJ_DIR)

fclean:		clean
	@echo "Removing library..."
	@$(RM) $(NAME)
	@$(eval OBJS_CREATED = 0)

re:			fclean all

$(NAME):	$(OBJS)
	@echo "Compiling library..."
	@ar crs $(NAME) $^


$(OBJS): $(OBJ_DIR)/%.o : $(SRC_DIR)/%.c | $(addprefix $(OBJ_DIR)/, $(IS_DIR) $(LST_DIR) $(LST_DIR) $(MEM_DIR) $(PUT_DIR) $(STR_DIR) $(TO_DIR) $(NUMLEN_DIR) $(FT_PRINTF_DIR) $(GNL_DIR) $(MATH_DIR) $(FILE_DIR))
	@$(eval OBJS_CREATED = $(shell expr $(OBJS_CREATED) + 1))
	@printf "Making object $(OBJS_CREATED)/$(SRCS_NUM)...\r"
	@if [ $(OBJS_CREATED) = $(SRCS_NUM) ]; then echo ""; fi
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@


$(OBJ_DIR)/$(IS_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(LST_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(MEM_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(PUT_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(STR_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(TO_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(FT_PRINTF_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(GNL_DIR):
	@mkdir -p $@

.PHONY: all obj_dirs clean fclean re
