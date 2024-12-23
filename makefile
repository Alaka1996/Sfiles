# Makefile

CC = gcc                   # Compiler to use
CFLAGS = -Wall -Iinclude    # Compiler flags
SRC_DIR = src               # Directory for source files
OBJ_DIR = obj               # Directory for object files
BIN_DIR = bin               # Directory for the final binary
TARGET = $(BIN_DIR)/sensor_program  # Final binary name

# List of source files
SRC = $(SRC_DIR)/sensor.c $(SRC_DIR)/utils.c main.c

# Object files are the corresponding .o files of the .c files
OBJ = $(SRC:%.c=$(OBJ_DIR)/%.o)

# Default target: build the program
all: $(TARGET)

# Rule to link object files into the final executable
$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

# Rule to compile source files into object files
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(OBJ_DIR)           # Create object directory if it doesn't exist
	$(CC) $(CFLAGS) -c $< -o $@

# Clean the project: remove object files and the executable
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

.PHONY: all clean
