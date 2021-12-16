include ../../Makefile.inc

ASSETS=$(shell xargs < assets.txt)
THEMES_DIR=../../../themes/

.PHONY: build $(COLOR_VARIANTS) clean

build:
	for variant in Light Dark Darkest; \
	do \
		mkdir -p $(THEMES_DIR)Flat-Remix-$$variant-Metacity/metacity-1/ ; \
		for asset in $(ASSETS) ; \
		do \
			echo ; \
			echo Rendering $$asset.svg ; \
			$(INKSCAPE) --export-id=$$asset \
				        --export-id-only \
				        --export-filename=$(THEMES_DIR)Flat-Remix-$$variant-Metacity/metacity-1/$$asset.svg \
				        Assets-$$variant.svg > /dev/null 2>&1; \
		done ; \
	done

clean:
