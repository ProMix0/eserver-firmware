
build/Makefile:
	mkdir -p build
	cd build && ../src/configure	\
		--prefix=	\
		--with-headers="$(BUILD_TREE_DIR)/include"	\
		--disable-static	\
		--disable-doc

.PHONY: build install

build: build/Makefile
	make -C build $(COMMON_MAKEFLAGS)

install:
	make -C build install DESTDIR="$(BUILD_TREE_DIR)"

