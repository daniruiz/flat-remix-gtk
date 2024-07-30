include ../../Makefile.inc

SRC_FILE=assets.svg
ASSETS_DIR=assets-global
INDEX=assets.txt
THEMES_DIR=../../../themes/

.PHONY: build clean

build:
	mkdir -p $(ASSETS_DIR)
	for i in $$(xargs < $(INDEX)) ; \
	do \
		echo ; \
		echo Rendering $(ASSETS_DIR)/$$i.png ; \
		$(INKSCAPE) --export-id=$$i \
		            --export-id-only \
		            --export-filename=$(ASSETS_DIR)/$$i.png $(SRC_FILE) > /dev/null 2>&1 \
		&& $(OPTIPNG) $(ASSETS_DIR)/$$i.png ; \
		echo ; \
		echo Rendering $(ASSETS_DIR)$$i@2.png ; \
		$(INKSCAPE) --export-id=$$i \
		            --export-dpi=180 \
		            --export-id-only \
		            --export-filename=$(ASSETS_DIR)/$$i@2.png $(SRC_FILE) > /dev/null 2>&1 \
		&& $(OPTIPNG) $(ASSETS_DIR)/$$i@2.png ; \
	done
	for variant in $(COLOR_VARIANTS) ; \
	do \
		mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$$variant-Light/libadwaita/assets/ ; \
		mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$$variant-Dark/libadwaita/assets/ ; \
		mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$$variant-Darkest/libadwaita/assets/ ; \
		cp $(ASSETS_DIR)/* $(THEMES_DIR)Flat-Remix-GTK-$$variant-Light/libadwaita/assets/ ; \
		cp $(ASSETS_DIR)/* $(THEMES_DIR)Flat-Remix-GTK-$$variant-Dark/libadwaita/assets/ ; \
		cp $(ASSETS_DIR)/* $(THEMES_DIR)Flat-Remix-GTK-$$variant-Darkest/libadwaita/assets/ ; \
		ln -nrsvf $(THEMES_DIR)Flat-Remix-GTK-$$variant-Light/libadwaita/assets/ $(THEMES_DIR)Flat-Remix-GTK-$$variant-Light/gtk-4.0/assets; \
		ln -nrsvf $(THEMES_DIR)Flat-Remix-GTK-$$variant-Dark/libadwaita/assets/ $(THEMES_DIR)Flat-Remix-GTK-$$variant-Dark/gtk-4.0/assets; \
		ln -nrsvf $(THEMES_DIR)Flat-Remix-GTK-$$variant-Darkest/libadwaita/assets/ $(THEMES_DIR)Flat-Remix-GTK-$$variant-Darkest/gtk-4.0/assets; \
	done

clean:
	-rm -r $(ASSETS_DIR)
