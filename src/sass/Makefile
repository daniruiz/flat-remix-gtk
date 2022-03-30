include ../Makefile.inc

THEMES_DIR=../../themes/

.PHONY: build clean

build: clean
	$(MAKE) $(TARGETS)
	for COLOR in $(COLOR_VARIANTS); \
	do \
	  mkdir -p $(foreach VARIANT,Light Dark Darkest,$(THEMES_DIR)Flat-Remix-GTK-$$COLOR-$(VARIANT)/gtk-3.0/); \
	  mkdir -p $(foreach VARIANT,Light Dark Darkest,$(THEMES_DIR)Flat-Remix-GTK-$$COLOR-$(VARIANT)/gtk-4.0/); \
	  mkdir -p $(foreach VARIANT,Light Dark Darkest,$(THEMES_DIR)Flat-Remix-GTK-$$COLOR-$(VARIANT)/cinnamon/); \
	  mkdir -p $(foreach VARIANT,Light Dark Darkest,$(THEMES_DIR)Flat-Remix-LibAdwaita-$$COLOR-$(VARIANT)/); \
	  cp gtk3-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/gtk-3.0/gtk.css ; \
	  cp gtk3-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/gtk-3.0/gtk-solid.css ; \
	  cp gtk3-dark-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/gtk-3.0/gtk-dark.css ; \
	  cp gtk3-dark-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/gtk-3.0/gtk-dark-solid.css ; \
	  cp gtk3-dark-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/gtk-3.0/gtk.css ; \
	  cp gtk3-dark-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/gtk-3.0/gtk-solid.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/gtk-3.0/gtk-dark.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/gtk-3.0/gtk-dark-solid.css ; \
	  cp gtk3-darkest-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/gtk-3.0/gtk.css ; \
	  cp gtk3-darkest-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/gtk-3.0/gtk-solid.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/gtk-3.0/gtk-dark.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/gtk-3.0/gtk-dark-solid.css ; \
	  cp gtk4-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/gtk-4.0/gtk.css ; \
	  cp gtk4-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/gtk-4.0/gtk-solid.css ; \
	  cp gtk4-dark-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/gtk-4.0/gtk-dark.css ; \
	  cp gtk4-dark-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/gtk-4.0/gtk-dark-solid.css ; \
	  cp gtk4-dark-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/gtk-4.0/gtk.css ; \
	  cp gtk4-dark-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/gtk-4.0/gtk-solid.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/gtk-4.0/gtk-dark.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/gtk-4.0/gtk-dark-solid.css ; \
	  cp gtk4-darkest-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/gtk-4.0/gtk.css ; \
	  cp gtk4-darkest-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/gtk-4.0/gtk-solid.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/gtk-4.0/gtk-dark.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/gtk-4.0/gtk-dark-solid.css ; \
	  cp cinnamon-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/cinnamon/cinnamon.css ; \
	  cp cinnamon-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/cinnamon/cinnamon-solid.css ; \
	  cp cinnamon-dark-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/cinnamon/cinnamon.css ; \
	  cp cinnamon-dark-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/cinnamon/cinnamon-solid.css ; \
	  cp cinnamon-darkest-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/cinnamon/cinnamon.css ; \
	  cp cinnamon-darkest-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/cinnamon/cinnamon-solid.css ; \
	  cp libadwaita-$$COLOR.css $(THEMES_DIR)Flat-Remix-LibAdwaita-$$COLOR-Light/gtk.css ; \
	  cp libadwaita-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-LibAdwaita-$$COLOR-Light/gtk-solid.css ; \
	  cp libadwaita-dark-$$COLOR.css $(THEMES_DIR)Flat-Remix-LibAdwaita-$$COLOR-Dark/gtk.css ; \
	  cp libadwaita-dark-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-LibAdwaita-$$COLOR-Dark/gtk-solid.css ; \
	  cp libadwaita-darkest-$$COLOR.css $(THEMES_DIR)Flat-Remix-LibAdwaita-$$COLOR-Darkest/gtk.css ; \
	  cp libadwaita-darkest-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-LibAdwaita-$$COLOR-Darkest/gtk-solid.css ; \
	done

define scss_to_css
%-$(1).css: %.scss
	sed -e '/$$$$selected_bg_color/c $$$$selected_bg_color: $$(COLOR_$(1));' \
	    -e '/$$$$selected_fg_color/c $$$$selected_fg_color: $$(TEXT_COLOR_$(1));' $$< \
	  | $(SCSS) > $$@
	$$(if $$(findstring gtk, $$@), \
	  cat $(wildcard gtk-applications-css/**/*.css) >> $$@)

TARGETS += $$(patsubst %.scss,%-$(1).css,$$(wildcard *.scss))
endef

$(foreach COLOR_VARIANT,$(COLOR_VARIANTS),$(eval $(call scss_to_css,$(COLOR_VARIANT))))

clean:
	-rm *.css
