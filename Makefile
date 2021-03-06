ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard
NoClutter_EXTRA_FRAMEWORKS += Cephei
NoClutter_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoClutter
NoClutter_FILES = Tweak.xm
export TARGET = iphone:clang:13.0:7.0

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += noclutterprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
