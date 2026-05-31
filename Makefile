include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HackEFoot
HackEFoot_FILES = Tweak.xm
HackEFoot_PLIST = HackEFoot.plist
HackEFoot_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
