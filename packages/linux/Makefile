

build:
#	make -C src defconfig
	cmp config src/.config || cp config src/.config
	make -C src -j$(shell nproc)

install:
	cp src/vmlinux $(INSTALLDIR)/images/vmlinux

