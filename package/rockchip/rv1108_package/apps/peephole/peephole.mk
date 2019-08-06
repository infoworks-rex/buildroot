PEEPHOLE_SITE = $(TOPDIR)/../app/peephole
PEEPHOLE_SITE_METHOD = local
PEEPHOLE_INSTALL_STAGING = YES

# add dependencies
PEEPHOLE_DEPENDENCIES = librkfb librkrga

COMPILE_PROJECT_TYPE=$(call qstrip,$(BR2_PACKAGE_LOCK_PROJECT_TYPE))

PEEPHOLE_DEPENDENCIES += libpng12 rv1108_minigui
ifeq ($(BR2_PACKAGE_FREETYPE), y)
	PEEPHOLE_DEPENDENCIES += freetype
	PEEPHOLE_CONF_OPTS += -DCOMPILE_UI_TRUETYPE=y
endif

ifeq ($(BR2_PACKAGE_TSLIB), y)
	PEEPHOLE_DEPENDENCIES += tslib
	PEEPHOLE_CONF_OPTS += -DCOMPILE_UI_TSLIB=y
endif

ifeq ($(BR2_PACKAGE_SQLITE),y)
	PEEPHOLE_DEPENDENCIES += sqlite
	PEEPHOLE_CONF_OPTS += -DUSE_SQLITE=y
endif

ifeq ($(BR2_PACKAGE_DATABASE),y)
	PEEPHOLE_DEPENDENCIES += database
	PEEPHOLE_CONF_OPTS += -DUSE_DATABASE=y
endif

PEEPHOLE_CONF_OPTS += -DCOMPILE_PROJECT_TYPE=$(BR2_PACKAGE_LOCK_PROJECT_TYPE)
PEEPHOLE_CONF_OPTS += -DCOMPILE_BOARD_VERSION=$(BR2_RV1108_BOARD_VERSION)
PEEPHOLE_CONF_OPTS += -DResolution=$(call qstrip,$(BR2_RV1108_LCD_RESOLUTION))

$(eval $(cmake-package))
