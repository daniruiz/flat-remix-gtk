SUBDIRS=$(foreach SUBDIR,cinnamon gtk2 gtk3 metacity xfwm4,assets-renderer/$(SUBDIR)) sass
THEMES_DIR=../themes

include Makefile.inc

.PHONY: build $(SUBDIRS) clean

build: $(SUBDIRS)
	$(MAKE) -C templates build
	# Remove variants that are not valid
	rm -rf $(foreach variant,$(UNWANTED_VARIANTS),$(THEMES_DIR)/Flat-Remix-GTK-$(variant)*)
	# Add Solid themes
	find $(THEMES_DIR) -name "Flat-Remix-GTK-*" ! -name "*Solid*" | while read gtk_theme; do \
		rm -rf "$${gtk_theme}-Solid"; \
		cp -a $$gtk_theme "$${gtk_theme}-Solid"; \
		[ -f "$${gtk_theme}-Solid"/gtk-3.0/gtk-solid.css ] && \
			mv "$${gtk_theme}-Solid"/gtk-3.0/gtk-solid.css "$${gtk_theme}-Solid"/gtk-3.0/gtk.css; \
		[ -f "$${gtk_theme}-Solid"/gtk-3.0/gtk-dark-solid.css ] \
			&& mv "$${gtk_theme}-Solid"/gtk-3.0/gtk-dark-solid.css "$${gtk_theme}-Solid"/gtk-3.0/gtk-dark.css; \
		[ -f "$${gtk_theme}-Solid"/cinnamon/cinnamon-solid.css ] && \
			mv "$${gtk_theme}-Solid"/cinnamon/cinnamon-solid.css "$${gtk_theme}-Solid"/cinnamon/cinnamon.css; \
		rm -f "$${gtk_theme}"/gtk-3.0/gtk-*solid.css "$${gtk_theme}"/cinnamon/cinnamon-solid.css; \
	done

$(SUBDIRS):
	$(MAKE) -C $@ build

clean:
	$(foreach SUBDIR,$(SUBDIRS),$(MAKE) -C $(SUBDIR) clean &&) true
