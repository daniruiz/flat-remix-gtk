SUBDIRS?=$(foreach SUBDIR,cinnamon gtk2 gtk3 libadwaita metacity thumbnail xfwm4,assets-renderer/$(SUBDIR)) sass
THEMES_DIR=../themes

include Makefile.inc

.PHONY: build $(SUBDIRS) clean

build: $(SUBDIRS)
	$(MAKE) -C templates build
	# Remove variants that are not valid
	rm -rf $(foreach variant,$(UNWANTED_VARIANTS),$(THEMES_DIR)/Flat-Remix-GTK-$(variant)*)
	rm -rf $(foreach variant,$(UNWANTED_VARIANTS),$(THEMES_DIR)/Flat-Remix-LibAdwaita-$(variant)*)
	# Add Solid themes
	rm -rf $(THEMES_DIR)/*-Solid
	find $(THEMES_DIR) -name "Flat-Remix-GTK-*" -or -name "Flat-Remix-LibAdwaita-*" \
		| while read gtk_theme; do \
			cp -a $$gtk_theme "$${gtk_theme}-Solid"; \
			find "$${gtk_theme}-Solid" -name "*-solid.css" \
				-exec sh -c 'mv $$1 $$(echo $$1 | sed "s/-solid//")' _ {} \; ; \
		done
	find $(THEMES_DIR) -name "*-solid.css" -delete

$(SUBDIRS):
	$(MAKE) -C $@ build

clean:
	$(foreach SUBDIR,$(SUBDIRS),$(MAKE) -C $(SUBDIR) clean &&) true
