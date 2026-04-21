TWEAK_NAME = MediaToolKit_Pro
MediaToolKit_Pro_FILES = Tweak.mm
MediaToolKit_Pro_FRAMEWORKS = UIKit Foundation Security QuartzCore
ARCHS = arm64
TARGET = iphone:clang:latest:14.0
MediaToolKit_Pro_LIBRARIES = substrate

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
