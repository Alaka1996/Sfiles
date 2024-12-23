# Makefile

CC = gcc                   # Compiler to use
CFLAGS = -Wall -Iinclude    # Compiler flags
SRC_DIR = src               # Directory for source files
OBJ_DIR = obj               # Directory for object files
BIN_DIR = bin               # Directory for the final binary
TARGET = $(BIN_DIR)/sensor_program  # Final binary name

# List of source files with full paths
SRC = $(SRC_DIR)/sensor.c $(SRC_DIR)/utils.c main.c

# Object files are the corresponding .o files of the .c files
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Default target: build the program
all: $(TARGET)

# Rule to link object files into the final executable
$(TARGET): $(OBJ)
	@mkdir -p $(BIN_DIR)           # Create bin directory if it doesn't exist
	$(CC) $(OBJ) -o $(TARGET)
	@echo "Build complete."

# Rule to compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)           # Create object directory if it doesn't exist
	$(CC) $(CFLAGS) -c $< -o $@
	@echo "Compiled: $<"

# Clean the project: remove object files and the executable
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
	@echo "Cleaned up."

.PHONY: all clean
