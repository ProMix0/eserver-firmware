include common.mk

ifneq ($(ESERVER_CONFIG_READED),1)
$(error Not configured! You must run ./configure first)
endif

.PHONY: all clean

# currently just pass to target
all:
	$(BASH_SET_FAIL)	\
	make -C targets/$(ESERVER_TARGET) 2>&1 | tee build.log

target_%:
	make $* -C targets/$(ESERVER_TARGET)

package_%:
	make $* -C packages

clean:
	make clean -C targets/$(ESERVER_TARGET)
	make clean -C packages
	rm -rf $(OUTDIR)/*
	rm -rf $(BUILD_TREE_DIR)/*

