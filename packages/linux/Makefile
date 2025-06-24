.PHONY: prepare build install clean

SRC_FLAGS := LLVM=1				
#		CC=$(TOOLCHAIN_DIR)/bin/clang	\
#		AR=$(TOOLCHAIN_DIR)/bin/llvm-ar	\
#		NM=$(TOOLCHAIN_DIR)/bin/llvm-nm	\
#		CFLAGS="-Wno-default-const-init-var-unsafe"	\
#		HOSTCC=clang

#SRC_FLAGS :=

src/.config: defconfig
	cp defconfig src/.config
	make -C src olddefconfig $(SRC_FLAGS) #silentoldconfig?

prepare: src/.config
	make -C src headers_install INSTALL_HDR_PATH="$(BUILD_TREE_DIR)" $(SRC_FLAGS)

build:
	make -C src $(BUILD_MAKEFLAGS) $(SRC_FLAGS)

install:
	cp src/vmlinux $(OUTDIR)/vmlinux

clean:
	cd src && git clean -xffd

