include ../../Makefile.inc

THEMES_DIR=../../../themes/

TEMPLATE_SELECTED_COLOR=\#c21953

.PHONY: build $(COLOR_VARIANTS) metacity

build: $(COLOR_VARIANTS) metacity

$(COLOR_VARIANTS):
	for variant in Light Dark Darkest; \
	do \
		mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$@-$$variant/gtk-3.0/ ; \
		sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
		    -e 's/$(TEMPLATE_SELECTED_COLOR)/$(TEXT_COLOR_$@)/gi' \
		    gtk3-$$variant.svg \
		| $(INKSCAPE) --pipe --export-filename=$(THEMES_DIR)Flat-Remix-GTK-$@-$$variant/gtk-3.0/thumbnail.png > /dev/null 2>&1 ; \
	done

metacity:
	for variant in Light Dark Darkest; \
	do \
		mkdir -p $(THEMES_DIR)Flat-Remix-$$variant-Metacity/metacity-1/ ; \
		sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
		    metacity-$$variant.svg \
		| $(INKSCAPE) --pipe --export-filename=$(THEMES_DIR)Flat-Remix-$$variant-Metacity/metacity-1/thumbnail.png > /dev/null 2>&1 ; \
	done

