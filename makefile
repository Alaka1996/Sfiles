# Compiler and flags
CC = gcc
CFLAGS = -Wall -Iinclude

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Target program
TARGET = $(BIN_DIR)/sensor_program

# Source files
SRC = $(wildcard $(SRC_DIR)/*.c) main.c

# Object files
OBJ = $(SRC:%.c=$(OBJ_DIR)/%.o)

# Default rule: build the program
all: $(TARGET)

# Linking rule
$(TARGET): $(OBJ)
	@mkdir -p $(BIN_DIR)
	$(CC) $(OBJ) -o $@
	@echo "Build complete."

# Compilation rule
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@
	@echo "Compiled: $<"

# Clean rule
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
	@echo "Cleaned up."

.PHONY: all clean
