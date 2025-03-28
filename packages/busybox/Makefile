

build:
#	make -C src defconfig
	cp config src/.config
	make -C src LDFLAGS='-static'

install:
	cp src/busybox $(ROMFSDIR)/bin/
	for prog in $$(src/busybox --list); do ln -sf /bin/busybox $(ROMFSDIR)/bin/$$prog; done

