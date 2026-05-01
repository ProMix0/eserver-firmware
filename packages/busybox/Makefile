.PHONY: build install clean

SRC_FLAGS := LDFLAGS="-L $(BUILD_TREE_DIR)/lib"	\
		CFLAGS="--sysroot $(BUILD_TREE_DIR) -I $(BUILD_TREE_DIR)/include"	\
		CC=$(TOOLCHAIN_DIR)/bin/clang	\
		NM=$(TOOLCHAIN_DIR)/bin/llvm-nm	\
		AR=$(TOOLCHAIN_DIR)/bin/llvm-ar

src/.config: config
	sed '/CONFIG_PREFIX/c\CONFIG_PREFIX="$(BUILD_TREE_DIR)"' <config >src/.config

build: src/.config
	make -C src/ busybox $(BUILD_MAKEFLAGS) $(SRC_FLAGS)

install:
	make install -C src $(SRC_FLAGS)

clean:
	cd src/ && git clean -xffd

