CC = g++
CFLAGS = -g -std=c++17 -I./include
LDFLAGS = -L./lib -lglfw3dll -lglfw3
SRC_DIR = src
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp) $(SRC_DIR)/glad.c
OBJ_DIR = obj
OBJ_FILES = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(filter %.cpp,$(SRC_FILES))) $(OBJ_DIR)/glad.o
TARGET = myprogram.exe

all: create_dirs $(TARGET)

$(TARGET): $(OBJ_FILES)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/glad.o: $(SRC_DIR)/glad.c
	$(CC) $(CFLAGS) -c $< -o $@

create_dirs:
	@if not exist $(OBJ_DIR) mkdir $(OBJ_DIR)

clean:
	del /Q /S obj myprogram.exe