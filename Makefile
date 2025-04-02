export OUTDIR=$(shell pwd)/out
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

.PHONY: all prepare build install clean

all: prepare build install

$(shell rm build.log)
build install:
	set -o pipefail;	\
	for package in $(PACKAGES); do	\
		make $@ -C $$package 2>&1 | tee -a build.log || exit 1;	\
	done

prepare:
	for package in $(PACKAGES); do	\
		make $@ -C $$package || true;	\
	done

clean:
	for package in $(PACKAGES); do	\
		make $@ -C $$package || exit 1;	\
	done
	rm -rf $(ROMFSDIR)
	rm -rf $(BUILD_TREE_DIR)/*

