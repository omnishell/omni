HERE           ?= $(PWD)
I3_DIR         ?= $${HOME}/.config/i3
I3_SCRIPTS_DIR ?= $(I3_DIR)/scripts
I3_CONF_DIR    ?= $(I3_DIR)/conf

__sync_dirs: 
	rm -rf $(I3_DIR)
	mkdir -p $(I3_DIR)
	ln -s $(HERE)/conf $(I3_CONF_DIR)
	ln -s $(HERE)/scripts $(I3_SCRIPTS_DIR)

__sync_files:
	[ -f $(I3_CONF_DIR)/i3.conf ] && ln -s $(I3_CONF_DIR)/i3.conf $(I3_DIR)/config

configure:
	$(MAKE) __sync_dirs
	$(MAKE) __sync_files
