APP_NAME = GettingStarted
LIGHTING_APP_NAME = Lighting
BUILD_DIR = ./bin
C_FILES = ./*.c
CPP_FILES = ./stb_image.cpp
GETTING_STARTED_FILES = ./gettingStarted.cpp
LIGHTING_FILES = ./lighting.cpp

APP_DEFINES:=
APP_INCLUDES:= -I./include -framework Cocoa -framework OpenGL -framework IOKit
APP_LINKERS:= -L./lib/lib-arm64 -lglfw3

# General compiler flags (add any flags you might need)
CFLAGS = $(APP_DEFINES) $(APP_INCLUDES)
LFLAGS = $(APP_LINKERS)

# Rule for building the original GettingStarted application
$(BUILD_DIR)/$(APP_NAME): $(C_FILES) $(CPP_FILES) $(GETTING_STARTED_FILES)
	clang++ $(C_FILES) $(CPP_FILES) $(GETTING_STARTED_FILES) -o $@ $(CFLAGS) $(LFLAGS)

# Rule for building the new Lighting executable
$(BUILD_DIR)/$(LIGHTING_APP_NAME): $(C_FILES) $(CPP_FILES) $(LIGHTING_FILES)
	clang++ $(C_FILES) $(CPP_FILES) $(LIGHTING_FILES) -o $@ $(CFLAGS) $(LFLAGS)

# Targets
build-getting-started: $(BUILD_DIR)/$(APP_NAME)

build-lighting: $(BUILD_DIR)/$(LIGHTING_APP_NAME)

clean:
	rm -f $(BUILD_DIR)/$(APP_NAME) $(BUILD_DIR)/$(LIGHTING_APP_NAME)
