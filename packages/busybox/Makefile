.PHONY: build install clean

build:
#	make -C src defconfig
	cp config src/.config
	make -C src LDFLAGS='-L $(BUILD_TREE_DIR)/lib' $(COMMON_MAKEFLAGS) CFLAGS='--sysroot $(BUILD_TREE_DIR) -I $(BUILD_TREE_DIR)/include'

install:
	cp src/busybox $(BUILD_TREE_DIR)/bin/
	for prog in $$(src/busybox --list); do	\
		[ -e $(BUILD_TREE_DIR)/bin/$$prog ] ||	\
		ln -sf /bin/busybox $(BUILD_TREE_DIR)/bin/$$prog;	\
	done

clean:
	cd src/ && git clean -xffd

