mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(patsubst %/,%,$(dir $(mkfile_path)))

# It will mess with nested packaged makefiles
#MAKEFLAGS += --warn-undefined-variables

export OUTDIR:=$(mkfile_dir)/out
export BUILD_DIR:=$(mkfile_dir)/build
export SCRIPTS_DIR:=$(mkfile_dir)/scripts
export PACKAGES_DIR:=$(mkfile_dir)/packages
export TARGETS_DIR:=$(mkfile_dir)/targets

export ROMFS_DIR:=$(OUTDIR)/romfs
export STAGING_TREE_DIR:=$(BUILD_DIR)/staging_tree
export TOOLCHAIN_DIR:=$(BUILD_DIR)/toolchain

export BUILD_MAKEFLAGS:=-j$(shell nproc)
export BASH_SET_FAIL:=set -o pipefail; set -e;
export PATH:=$(SCRIPTS_DIR):$(PATH)

-include .config

export CURRENT_TARGET_DIR:=$(TARGETS_DIR)/$(ESERVER_TARGET)

