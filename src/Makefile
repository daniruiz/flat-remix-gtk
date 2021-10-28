SUBDIRS=$(foreach SUBDIR,cinnamon gtk2 gtk3 metacity xfwm4,assets-renderer/$(SUBDIR)) sass
THEMES_DIR=../themes

include Makefile.inc

.PHONY: build $(SUBDIRS) clean

build: $(SUBDIRS)
	$(MAKE) -C templates build
	# Remove variants that are not valid
	rm -rf $(foreach variant,$(UNWANTED_VARIANTS),$(THEMES_DIR)/Flat-Remix-GTK-$(variant)*)

$(SUBDIRS):
	$(MAKE) -C $@ build

clean:
	$(foreach SUBDIR,$(SUBDIRS),$(MAKE) -C $(SUBDIR) clean &&) true
