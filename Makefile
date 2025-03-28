export INSTALLDIR=$(PWD)/out
export ROMFSDIR=$(INSTALLDIR)/romfs

PACKAGES_NAMES=linux busybox
PACKAGES=$(addprefix packages/,$(PACKAGES_NAMES))

.PHONY: all build install

all: build install

build install:
	for package in $(PACKAGES); do	\
	make $@ -C $$package || exit 1;	\
	done

