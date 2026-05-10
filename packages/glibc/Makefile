$(PKG_BUILD_DIR)/Makefile:
	mkdir -p $(PKG_BUILD_DIR)
	# -Wno-error=attribute-alias for docker alpine's musl
	# TODO make src path
	cd $(PKG_BUILD_DIR) && ../src/configure	\
		--prefix=	\
		--with-headers="$(STAGING_TREE_DIR)/include"	\
		--with-sysheaders=''	\
		--disable-static	\
		--enable-shared	\
		CFLAGS='-Wno-error=attribute-alias -O2'	\
		--disable-doc	\
		--with-sysroot="$(STAGING_TREE_DIR)"	\
		--with-build-sysroot="$(STAGING_TREE_DIR)"

.PHONY: build install clean

build: $(PKG_BUILD_DIR)/Makefile
	make -C $(PKG_BUILD_DIR)/ lib $(BUILD_MAKEFLAGS)

install:
	make -C $(PKG_BUILD_DIR)/ install DESTDIR="$(STAGING_TREE_DIR)"

clean:
	rm -rf $(PKG_BUILD_DIR)

