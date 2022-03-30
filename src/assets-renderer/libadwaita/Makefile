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
		mkdir -p $(THEMES_DIR)Flat-Remix-LibAdwaita-$$variant-Light/assets/ ; \
		mkdir -p $(THEMES_DIR)Flat-Remix-LibAdwaita-$$variant-Dark/assets/ ; \
		mkdir -p $(THEMES_DIR)Flat-Remix-LibAdwaita-$$variant-Darkest/assets/ ; \
		cp $(ASSETS_DIR)/* $(THEMES_DIR)Flat-Remix-LibAdwaita-$$variant-Light/assets/ ; \
		cp $(ASSETS_DIR)/* $(THEMES_DIR)Flat-Remix-LibAdwaita-$$variant-Dark/assets/ ; \
		cp $(ASSETS_DIR)/* $(THEMES_DIR)Flat-Remix-LibAdwaita-$$variant-Darkest/assets/ ; \
	done

clean:
	-rm -r $(ASSETS_DIR)
