HERE       ?= $(PWD)
XINIT_FILE ?= $${HOME}/.xinitrc
XTERM_FILE ?= $${HOME}/.Xresources

.ONESHELL:

__link_files:
	rm -rf $(XINIT_FILE)
	ln -s $(HERE)/conf/xinit $(XINIT_FILE)
	rm -rf $(XTERM_FILE)
	ln -s $(HERE)/conf/xterm $(XTERM_FILE)

configure:
	$(MAKE) __link_files
