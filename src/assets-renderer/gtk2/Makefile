include ../../Makefile.inc

ASSETS=$(shell xargs < assets.txt)
THEMES_DIR=../../../themes/

TEMPLATE_SELECTED_COLOR=\#c21953


.PHONY: build $(COLOR_VARIANTS) clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	for variant in Light Dark Darkest ; \
	do \
		mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$@-$$variant/gtk-2.0/assets/ ; \
		sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
		    -e 's/$(TEMPLATE_SELECTED_COLOR)/$(TEXT_COLOR_$@)/gi' \
		    Assets-$$variant.svg > __Assets-$$variant-$@.svg ; \
		for asset in $(ASSETS) ; \
		do \
			echo ; \
			echo Rendering $$asset.png $@ $$variant ; \
			$(INKSCAPE) --export-id=$$asset \
				        --export-id-only \
				        --export-filename=$(THEMES_DIR)Flat-Remix-GTK-$@-$$variant/gtk-2.0/assets/$$asset.png \
				        __Assets-$$variant-$@.svg > /dev/null 2>&1; \
		done ; \
	done

clean:
	-rm __*
