# Compiler and flags
CC = gcc
CFLAGS = -Wall -Iinclude

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Files
SRC = $(wildcard $(SRC_DIR)/*.c) main.c
OBJ = $(SRC:%.c=$(OBJ_DIR)/%.o)
TARGET = $(BIN_DIR)/sensor_program

# Default rule
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJ)
	@mkdir -p $(BIN_DIR)
	$(CC) $(OBJ) -o $@
	@echo "Build complete."

# Compile source files to object files
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@
	@echo "Compiled: $<"

# Clean up build artifacts
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
	@echo "Cleaned up."

# Declare phony targets
.PHONY: all clean
