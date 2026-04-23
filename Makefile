include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = kaiosama-ios

kaiosama-ios_FILES = main.cpp \
    core_server/server.cpp \
    hook_engine/hook_engine.cpp \
    memory_engine/memory_engine.cpp \
    exploit_framework/exploit_framework.mm \
    overlay/imgui_overlay.mm \
    utils/utils.cpp \
    log_manager/log_manager.mm

ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:15.0

kaiosama-ios_CFLAGS = -fobjc-arc -std=c++20
kaiosama-ios_LDFLAGS = -framework Foundation -framework UIKit

include $(THEOS_MAKE_PATH)/library.mk

after-package::
	@echo "✅ kaiosama-ios.dylib compilado correctamente (listo para ESign)"
