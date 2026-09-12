TARGET := iphone:clang:latest:10.0
ARCHS := armv7

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = TVRemote

TVRemote_FILES = \
    TVRemote/main.m \
    TVRemote/TVRemoteAppDelegate.m \
    TVRemote/TVRemoteViewController.m

TVRemote_FRAMEWORKS = UIKit Foundation CoreGraphics
TVRemote_CFLAGS = -fobjc-arc
TVRemote_INSTALL_PATH = /Applications
TVRemote_RESOURCE_FILES = \
    TVRemote/Resources/Icon-57.png \
    TVRemote/Resources/Icon-60.png

include $(THEOS_MAKE_PATH)/application.mk
