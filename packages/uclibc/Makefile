.PHONY: build install clean

SRC_FLAGS := KERNEL_HEADERS=$(BUILD_TREE_DIR)/include/ 	\
		CC=$(TOOLCHAIN_DIR)/bin/clang		\
		NM=$(TOOLCHAIN_DIR)/bin/llvm-nm	\
		AR=$(TOOLCHAIN_DIR)/bin/llvm-ar

src/.config: defconfig
	cp defconfig src/.config
	make -C src olddefconfig

build: src/.config
	make -C src $(BUILD_MAKEFLAGS) $(SRC_FLAGS)

install:
	make -C src install PREFIX="$(BUILD_TREE_DIR)/" DEVEL_PREFIX="/" $(SRC_FLAGS)

clean:
	cd src/ && git clean -xffd

