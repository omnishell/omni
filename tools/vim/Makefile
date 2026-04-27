HERE         ?= ${CONF_TOOLS}/vim
VIM_DIR      ?= $${HOME}/.vim
SYNTAX_DIR   ?= $(VIM_DIR)/after/syntax
COLORS_DIR   ?= $(VIM_DIR)/colors
SPELL_DIR    ?= $(VIM_DIR)/spell
SNIPS_DIR    ?= $(VIM_DIR)/snips
INIT_FILE    ?= $(VIM_DIR)/vimrc
LSP_FILE     ?= $(VIM_DIR)/coc-settings.json

.ONESHELL:

__link_dirs:
	rm -rf $(VIM_DIR)
	mkdir -p $(VIM_DIR)/after
	ln -sf $(HERE)/scripts/syntax -t $(VIM_DIR)/after
	ln -sf $(HERE)/scripts/colors -t $(VIM_DIR)
	ln -sf $(HERE)/other/spell -t $(VIM_DIR)
	ln -sf $(HERE)/other/snips -t $(VIM_DIR)

__link_files:
	rm -rf $(INIT_FILE);
	ln -sf $(HERE)/init.vim $(INIT_FILE)
	rm -rf $(LSP_FILE);
	ln -sf $(HERE)/other/lsp.json $(LSP_FILE)

configure:
	$(MAKE) __link_dirs
	$(MAKE) __link_files
