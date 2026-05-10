.PHONY: build install clean

SRC_FLAGS := KERNEL_HEADERS=$(STAGING_TREE_DIR)/include/ 	\
		CC=$(TOOLCHAIN_DIR)/bin/clang		\
		NM=$(TOOLCHAIN_DIR)/bin/llvm-nm	\
		AR=$(TOOLCHAIN_DIR)/bin/llvm-ar

src/.config: config
	cp config src/.config

build: src/.config
	make -C src/ $(BUILD_MAKEFLAGS) $(SRC_FLAGS)

install:
	make -C src/ install PREFIX="$(STAGING_TREE_DIR)/" DEVEL_PREFIX="/" $(SRC_FLAGS)

clean:
	cd src/ && git clean -xffd

