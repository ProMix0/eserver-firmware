build/Makefile:
	mkdir -p build
	# -Wno-error=attribute-alias for docker alpine's musl
	cd build && ../src/configure	\
		--prefix=	\
		--with-headers="$(BUILD_TREE_DIR)/include"	\
		--with-sysheaders=''	\
		--disable-static	\
		--enable-shared	\
		CFLAGS='-Wno-error=attribute-alias -O2'	\
		--disable-doc	\
		--with-sysroot="$(BUILD_TREE_DIR)"	\
		--with-build-sysroot="$(BUILD_TREE_DIR)"

.PHONY: build install clean

build: build/Makefile
	make -C build $(BUILD_MAKEFLAGS)

install:
	make -C build install DESTDIR="$(BUILD_TREE_DIR)"

clean:
	cd src/ && git clean -xffd
	rm -rf build

