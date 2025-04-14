.PHONY: prepare build install clean

src/.config: defconfig
	cp defconfig src/.config
	make -C src olddefconfig #silentoldconfig?

prepare: src/.config
	make -C src headers_install INSTALL_HDR_PATH="$(BUILD_TREE_DIR)"

build:
	make -C src $(BUILD_MAKEFLAGS)

install:
	cp src/vmlinux $(OUTDIR)/vmlinux

clean:
	cd src && git clean -xffd

