.PHONY: build install clean

export LDFLAGS=-L $(BUILD_TREE_DIR)/lib
#TODO write sysroot to config
export CFLAGS=--sysroot $(BUILD_TREE_DIR) -I $(BUILD_TREE_DIR)/include
build:
#	make -C src defconfig
	cp config src/.config
	sed -i '/CONFIG_PREFIX/c\CONFIG_PREFIX="$(BUILD_TREE_DIR)"' src/.config
	make -C src $(BUILD_MAKEFLAGS)

install:
#	cp src/busybox $(BUILD_TREE_DIR)/bin/
#	for prog in $$(src/busybox --list); do	\
#		[ -e $(BUILD_TREE_DIR)/bin/$$prog ] ||	\
#		ln -sf /bin/busybox $(BUILD_TREE_DIR)/bin/$$prog;	\
#	done
	make install -C src

clean:
	cd src/ && git clean -xffd

