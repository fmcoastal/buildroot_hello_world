################################################################################
#
# Hello World
#
# the directives below are defined in:
#
# from https://groups.google.com/forum/#!topic/acmesystems/kPjYepcftLM
# 
################################################################################

HELLO_WORLD_VERSION = 1.0.0
HELLO_WORLD_SOURCE = hello_world-$(HELLO_WORLD_VERSION).tgz

####  WHERE TO DOWNLOAD YORU SOURCE FROM

# this does not work, need to figure out the proper syntax.
HELLO_WORLD_SITE_METHOD = wget
HELLO_WORLD_SITE = root@10.11.65.84:80

#HELLO_WORLD_SITE_METHOD = local
#HELLO_WORLD_SITE = /scratch/hello_world

#HELLO_WORLD_SITE_METHOD = http
#HELLO_WORLD_SITE = https://github.com/fmcoastal

####  END Download Options

HELLO_WORLD_LICENSE = GPL-2.0
HELLO_WORLD_LICENSE_FILES = COPYING

HELLOWORLD_INSTALL_TARGET:=YES

#BUILD COMMAND LINE
#  if defined, buildroot will execute.
define HELLO_WORLD_BUILD_CMDS
        $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

#INSTALL COMMAND LINE
#  if defined, buildroot will execute.
define HELLO_WORLD_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/hello_world $(TARGET_DIR)/bin
endef

#HOW PERMISSIONS ARE SET
#  if defined, buildroot will execute.
define HELLO_WORLD_PERMISSIONS
       /bin/hello_world f 4755 0 0 - - - - - 
endef


$(eval $(generic-package))


