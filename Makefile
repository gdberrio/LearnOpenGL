APP_NAME = GLtests
BUILD_DIR = ./bin
C_FILES = ./*.c

APP_DEFINES:=
APP_INCLUDES:= -I./include -framework Cocoa -framework OpenGL -framework IOKit
APP_LINKERS:= -L./lib/lib-arm64 -lglfw3

build:
	clang $(C_FILES) -o $(BUILD_DIR)/$(APP_NAME) $(APP_INCLUDES) $(APP_LINKERS)


