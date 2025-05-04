include ../Makefile.inc

THEMES_DIR=../../themes/

.PHONY: build clean

build: clean
	$(MAKE) $(TARGETS)
	
	# Replace conditional stuff. For example, see the definition
	# for "flowboxchild:selected image" in nautilus/Adwaita.css.
	# The way this works is we have an existing commented line
	# which ends with the embedded comment "* Make: GTK3 only */"
	# for GTK 3 (and 4 for GTK4). Note the missing starting slash,
	# that's because we can't have nested comments in CSS for some
	# reason. We need to add it ourselves when uncommenting line.
	ls gtk3-*.css | xargs sed -i 's|^\(\s*\)\(/\*\)\(.*\)\(\* Make: GTK3 only \*/\)$$|\1\3/\4|'
	ls gtk4-*.css | xargs sed -i 's|^\(\s*\)\(/\*\)\(.*\)\(\* Make: GTK4 only \*/\)$$|\1\3/\4|'
	
	for COLOR in $(COLOR_VARIANTS); \
	do \
	  mkdir -p $(foreach VARIANT,Light Dark Darkest,$(THEMES_DIR)Flat-Remix-GTK-$$COLOR-$(VARIANT)/gtk-3.0/); \
	  mkdir -p $(foreach VARIANT,Light Dark Darkest,$(THEMES_DIR)Flat-Remix-GTK-$$COLOR-$(VARIANT)/gtk-4.0/); \
	  mkdir -p $(foreach VARIANT,Light Dark Darkest,$(THEMES_DIR)Flat-Remix-GTK-$$COLOR-$(VARIANT)/cinnamon/); \
	  mkdir -p $(foreach VARIANT,Light Dark Darkest,$(THEMES_DIR)Flat-Remix-GTK-$$COLOR-$(VARIANT)/libadwaita/); \
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
	  cp libadwaita-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/libadwaita/gtk.css ; \
	  cp libadwaita-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Light/libadwaita/gtk-solid.css ; \
	  cp libadwaita-dark-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/libadwaita/gtk.css ; \
	  cp libadwaita-dark-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Dark/libadwaita/gtk-solid.css ; \
	  cp libadwaita-darkest-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/libadwaita/gtk.css ; \
	  cp libadwaita-darkest-solid-$$COLOR.css $(THEMES_DIR)Flat-Remix-GTK-$$COLOR-Darkest/libadwaita/gtk-solid.css ; \
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
