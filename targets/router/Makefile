.PHONY: all clean

.PHONY: prepare_buildtree build_libc build_packages build_image
all: prepare_buildtree build_libc build_packages build_image

BUILDTREE_DIRS = include lib bin
BUILDTREE_DEPENDS = $(addprefix $(BUILD_TREE_DIR)/,$(BUILDTREE_DIRS))
prepare_buildtree: $(BUILDTREE_DEPENDS)

$(BUILD_TREE_DIR)/%:
	mkdir -p $@

build_libc:
	make prepare -C $(PACKAGES_DIR)/linux
	make build -C $(PACKAGES_DIR) P=glibc
	make install -C $(PACKAGES_DIR) P=glibc

build_packages:
	make build -C $(PACKAGES_DIR) P=busybox
	make install -C $(PACKAGES_DIR) P=busybox
	mkdir -p $(OUTDIR) # temporary solution
	make build install -C $(PACKAGES_DIR)/linux
	# linux must be installed by platform
	# (maybe built too)

ROMFS_DIRS:=proc dev sys
build_image:
	mkdir -p $(addprefix $(ROMFS_DIR)/,$(ROMFS_DIRS))
	-unlink $(ROMFS_DIR)/lib64
	ln -sf lib $(ROMFS_DIR)/lib64
	#TODO copy only needed
	cp -r "$(BUILD_TREE_DIR)"/* "$(ROMFS_DIR)"/
	cp $(CURRENT_TARGET_DIR)/init $(ROMFS_DIR)/
	# TODO gzip (.cpio.gz)
	$(BASH_SET_FAIL)	\
	cd $(ROMFS_DIR) &&	\
	find . | cpio -o -R root:root -H newc > $(OUTDIR)/initrd.cpio

clean:
	# currantly a stub

