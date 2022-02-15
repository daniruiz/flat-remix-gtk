include ../../Makefile.inc

SRC_FILE=assets.svg
ASSETS_DIR=assets
SYMBOLIC_ASSETS_DIR=symbolic
INDEX=assets.txt
THEMES_DIR=../../../themes/

.PHONY: build $(COLOR_VARIANTS) clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	$(eval CURRENT_ASSETS_DIR=$(ASSETS_DIR)-$@/)
	sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' $(SRC_FILE) > assets-$@.svg
	mkdir -p $(CURRENT_ASSETS_DIR)
	cp $(SYMBOLIC_ASSETS_DIR)/* $(CURRENT_ASSETS_DIR)
	for i in $$(xargs < $(INDEX)) ; \
	do \
		echo ; \
		echo Rendering $(CURRENT_ASSETS_DIR)$$i.png ; \
		$(INKSCAPE) --export-id=$$i \
		            --export-id-only \
		            --export-filename=$(CURRENT_ASSETS_DIR)$$i.png assets-$@.svg > /dev/null 2>&1 \
		&& $(OPTIPNG) $(CURRENT_ASSETS_DIR)$$i.png ; \
		echo ; \
		echo Rendering $(CURRENT_ASSETS_DIR)$$i@2.png ; \
		$(INKSCAPE) --export-id=$$i \
		            --export-dpi=180 \
		            --export-id-only \
		            --export-filename=$(CURRENT_ASSETS_DIR)$$i@2.png assets-$@.svg > /dev/null 2>&1 \
		&& $(OPTIPNG) $(CURRENT_ASSETS_DIR)$$i@2.png ; \
	done
	mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$@-Light/gtk-3.0/assets/
	mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$@-Light/gtk-4.0/
	mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$@-Dark/gtk-3.0/assets/
	mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$@-Dark/gtk-4.0/
	mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$@-Darkest/gtk-3.0/assets/
	cp $(CURRENT_ASSETS_DIR)* $(THEMES_DIR)Flat-Remix-GTK-$@-Light/gtk-3.0/assets/
	cp $(CURRENT_ASSETS_DIR)* $(THEMES_DIR)Flat-Remix-GTK-$@-Dark/gtk-3.0/assets/
	cp $(CURRENT_ASSETS_DIR)* $(THEMES_DIR)Flat-Remix-GTK-$@-Darkest/gtk-3.0/assets/
	ln -nrsvf $(THEMES_DIR)Flat-Remix-GTK-$@-Light/gtk-3.0/assets/ $(THEMES_DIR)Flat-Remix-GTK-$@-Light/gtk-4.0/assets
	ln -nrsvf $(THEMES_DIR)Flat-Remix-GTK-$@-Dark/gtk-3.0/assets/ $(THEMES_DIR)Flat-Remix-GTK-$@-Dark/gtk-4.0/assets
	ln -nrsvf $(THEMES_DIR)Flat-Remix-GTK-$@-Darkest/gtk-3.0/assets/ $(THEMES_DIR)Flat-Remix-GTK-$@-Darkest/gtk-4.0/assets

clean:
	-rm -r $(foreach COLOR_VARIANT, $(COLOR_VARIANTS), \
	  $(ASSETS_DIR)-$(COLOR_VARIANT) \
	  assets-$(COLOR_VARIANT).svg)
