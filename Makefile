export OUTDIR=$(PWD)/out
export ROMFSDIR=$(OUTDIR)/romfs
export COMMON_MAKEFLAGS=-j$(shell nproc)
export BUILD_TREE_DIR=$(OUTDIR)/build_tree

PACKAGES_NAMES=linux glibc busybox
# short for PACKAGES
# allow to build a single package from cli
ifneq ($P,)
PACKAGES_NAMES:=$P
endif

PACKAGES=$(addprefix packages/,$(PACKAGES_NAMES))

.PHONY: all prepare build install

all: prepare build install

build install:
	for package in $(PACKAGES); do	\
	make $@ -C $$package || exit 1;	\
	done

prepare:
	for package in $(PACKAGES); do	\
	make $@ -C $$package || true;	\
	done

