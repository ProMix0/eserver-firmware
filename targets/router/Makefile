.PHONY: all prepare_buildtree build_packages generate_artifacts clean

all: prepare_buildtree build_packages generate_artifacts

BUILDTREE_DIRS = include lib bin
BUILDTREE_DEPENDS = $(addprefix $(BUILD_TREE_DIR)/,$(BUILDTREE_DIRS))
prepare_buildtree: $(BUILDTREE_DEPENDS)

$(BUILD_TREE_DIR)/%:
	mkdir -p $@

build_packages:
	make prepare -C $(PACKAGES_DIR)/linux
	make build -C $(PACKAGES_DIR) P=glibc
	make install -C $(PACKAGES_DIR) P=glibc
	make build -C $(PACKAGES_DIR) P=busybox
	make install -C $(PACKAGES_DIR) P=busybox
	make build install -C $(PACKAGES_DIR)/linux
	# linux must be installed by platform
	# (maybe built too)

generate_artifacts:
	make prepare_romfs -C $(CURRENT_PLATFORM_DIR)
	#TODO copy only needed
	cp -r "$(BUILD_TREE_DIR)"/* "$(ROMFS_DIR)"/
	make finish_romfs -C $(CURRENT_PLATFORM_DIR)
	make make_image -C $(CURRENT_PLATFORM_DIR)

clean:
	# currantly a stub
	
