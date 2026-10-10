# define where to pull the source files
LDD_VERSION = be5189faa237b62b8ab1ccb552e635cd60486306
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-0xBEE5-ClintFurrer.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

# Group BOTH driver directories together so Buildroot compiles them at once
LDD_MODULE_SUBDIRS = misc-modules scull

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/bin/scull_load
	$(INSTALL) -D -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/bin/scull_unload
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/bin/module_load
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/bin/module_unload
endef

$(eval $(kernel-module))
$(eval $(generic-package))
