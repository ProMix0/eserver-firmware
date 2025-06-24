.PHONY: build install clean

#SRC_FLAGS := KERNEL_HEADERS=$(BUILD_TREE_DIR)/include/

# TODO add clang and etc (DLLVM_ENABLE_PROJECTS)
build/Makefile:
	cmake -S src/llvm -B build -G Ninja		\
	-DCMAKE_INSTALL_PREFIX="$(TOOLCHAIN_DIR)"	\
	-DCMAKE_BUILD_TYPE=Release			\
	-DLLVM_ENABLE_PROJECTS="clang;lld"		\
	-DLLVM_ENABLE_RUNTIMES="compiler-rt"	\
	-DCLANG_DEFAULT_LINKER=lld			\
	-DCLANG_DEFAULT_RTLIB=compiler-rt

#	-DLLVM_LIBC_FULL_BUILD=ON
build: build/Makefile
	cmake --build build $(BUILD_MAKEFLAGS)

install:
	cmake --install build
#	cp -r "$(TOOLCHAIN_DIR)"/lib/* "$(BUILD_TREE_DIR)/lib/"

clean:
#	cd src/ && git clean -xffd
	rm -rf build

