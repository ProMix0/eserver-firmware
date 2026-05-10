.PHONY: build install clean

#SRC_FLAGS := KERNEL_HEADERS=$(STAGING_TREE_DIR)/include/

$(PKG_BUILD_DIR)/CMakeCache.txt:
	cmake -S src/llvm -B $(PKG_BUILD_DIR) -G Ninja	\
	-DCMAKE_INSTALL_PREFIX="$(TOOLCHAIN_DIR)"	\
	-DCMAKE_BUILD_TYPE=Release			\
	-DLLVM_ENABLE_PROJECTS="clang;lld"		\
	-DLLVM_ENABLE_RUNTIMES="compiler-rt"		\
	-DCLANG_DEFAULT_LINKER=lld			\
	-DCLANG_DEFAULT_RTLIB=compiler-rt
#	-DLLVM_LIBC_FULL_BUILD=ON

build: $(PKG_BUILD_DIR)/CMakeCache.txt
	cmake --build $(PKG_BUILD_DIR)/ $(BUILD_MAKEFLAGS)

install:
	cmake --install $(PKG_BUILD_DIR)/

clean:
	rm -rf $(PKG_BUILD_DIR)

