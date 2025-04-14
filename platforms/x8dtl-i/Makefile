.PHONY: prepare_romfs finish_romfs make_image

ROMFS_DIRS:=proc dev sys
ROMFS_DEPENDS:=$(addprefix $(ROMFS_DIR)/,$(ROMFS_DIRS))
prepare_romfs: $(ROMFS_DEPENDS)
	-unlink $(ROMFS_DIR)/lib64
	ln -sf lib $(ROMFS_DIR)/lib64

$(ROMFS_DIR)/%:
	mkdir -p $@

finish_romfs:
	cp $(CURRENT_PLATFORM_DIR)/init $(ROMFS_DIR)/

make_image:
	#TODO consider moving cpio'ing to target
	$(BASH_SET_FAIL)	\
	cd $(ROMFS_DIR) &&	\
	find . | cpio -o -R root:root -H newc > $(OUTDIR)/initrd.img

