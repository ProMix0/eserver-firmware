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
	make build install -C $(PACKAGES_DIR) P=llvm
	make build install -C $(PACKAGES_DIR) P=uclibc

build_packages:
	make build -C $(PACKAGES_DIR) P=busybox
	make install -C $(PACKAGES_DIR) P=busybox

ROMFS_DIRS:=proc dev sys
build_image:
	mkdir -p $(OUTDIR) # temporary solution
	mkdir -p $(addprefix $(ROMFS_DIR)/,$(ROMFS_DIRS))
	-unlink $(ROMFS_DIR)/lib64
	ln -sf lib $(ROMFS_DIR)/lib64
	#TODO copy only needed
	cp -r "$(BUILD_TREE_DIR)"/* "$(ROMFS_DIR)"/
	cp $(CURRENT_TARGET_DIR)/init $(ROMFS_DIR)/
	make_cpio_list.sh "$(ROMFS_DIR)" | filter_cpio.sh no-static no-include > $(OUTDIR)/cpio_list
	make build -C $(PACKAGES_DIR)/linux CONFIG_INITRAMFS_SOURCE="$(OUTDIR)/cpio_list" KBUILD_BUILD_TIMESTAMP=
	make install -C $(PACKAGES_DIR)/linux

clean:
	# currently a stub

