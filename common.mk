mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(patsubst %/,%,$(dir $(mkfile_path)))

export OUTDIR:=$(mkfile_dir)/out
export BUILD_DIR:=$(mkfile_dir)/build
export SCRIPTS_DIR:=$(mkfile_dir)/scripts
export PACKAGES_DIR:=$(mkfile_dir)/packages
export TARGETS_DIR:=$(mkfile_dir)/targets
export PLATFORMS_DIR:=$(mkfile_dir)/platforms

export CURRENT_TARGET_DIR=$(TARGETS_DIR)/$(ESERVER_TARGET)
export CURRENT_PLATFORM_DIR=$(PLATFORMS_DIR)/$(ESERVER_PLATFORM)

export ROMFS_DIR:=$(OUTDIR)/romfs
export BUILD_TREE_DIR:=$(BUILD_DIR)/build_tree

export BUILD_MAKEFLAGS:=-j$(shell nproc)
export BASH_SET_FAIL:=set -o pipefail; set -e;
export PATH:=$(SCRIPTS_DIR):$(PATH)

-include .config

