
prepare:
	cmp config src/.config || cp config src/.config
	make -C src headers_install INSTALL_HDR_PATH="$(BUILD_TREE_DIR)"

build:
	make -C src $(COMMON_MAKEFLAGS)

install:
	cp src/vmlinux $(OUTDIR)/images/vmlinux

