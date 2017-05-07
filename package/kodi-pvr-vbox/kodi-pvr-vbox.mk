################################################################################
#
# kodi-pvr-vbox
#
################################################################################

# This cset is on the branch 'Krypton'
# When Kodi is updated, then this should be updated to the corresponding branch
KODI_PVR_VBOX_VERSION = adc6c346cc3570a232d336fcebfb0905eaaa9b96
KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
KODI_PVR_VBOX_LICENSE = GPL-2.0+
KODI_PVR_VBOX_LICENSE_FILES = src/client.h
KODI_PVR_VBOX_DEPENDENCIES = kodi-platform

$(eval $(cmake-package))
