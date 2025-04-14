# short for PACKAGES
# allow to build a single package from cli
ifeq ($P,)
PACKAGES:=$(shell find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n')
else
PACKAGES:=$P
endif

.PHONY: prepare build install clean
SET_TERM_TITLE=term_title "$@ - $$package";

ifeq ($(MAKECMDGOALS),)
$(error Target for packages must be specified! \(prepare, build, install, clean\))
endif

build install:
	$(BASH_SET_FAIL)	\
	for package in $(PACKAGES); do	\
		$(SET_TERM_TITLE)	\
		make $@ -C $$package;	\
	done

# don't expect every package to have prepare
#prepare:
#	for package in $(PACKAGES); do	\
#		$(SET_TERM_TITLE)	\
#		make $@ -C $$package || true;	\
#	done

clean:
	$(BASH_SET_FAIL)	\
	for package in $(PACKAGES); do	\
		$(SET_TERM_TITLE)	\
		make $@ -C $$package;	\
	done

