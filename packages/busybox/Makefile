.PHONY: build install clean

#TODO write sysroot to config
SRC_FLAGS := LDFLAGS="-L $(BUILD_TREE_DIR)/lib"	\
		CFLAGS="--sysroot $(BUILD_TREE_DIR) -I $(BUILD_TREE_DIR)/include"	\
		CC=$(TOOLCHAIN_DIR)/bin/clang	\
		NM=$(TOOLCHAIN_DIR)/bin/llvm-nm	\
		AR=$(TOOLCHAIN_DIR)/bin/llvm-ar
build:
#	make -C src defconfig
	cp config src/.config
	sed -i '/CONFIG_PREFIX/c\CONFIG_PREFIX="$(BUILD_TREE_DIR)"' src/.config
	make -C src busybox $(BUILD_MAKEFLAGS) $(SRC_FLAGS)

install:
#	cp src/busybox $(BUILD_TREE_DIR)/bin/
#	for prog in $$(src/busybox --list); do	\
#		[ -e $(BUILD_TREE_DIR)/bin/$$prog ] ||	\
#		ln -sf /bin/busybox $(BUILD_TREE_DIR)/bin/$$prog;	\
#	done
	make install -C src $(SRC_FLAGS)

clean:
	cd src/ && git clean -xffd

