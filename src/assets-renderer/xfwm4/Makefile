include ../../Makefile.inc

ASSETS=$(shell xargs < assets.txt)
THEMES_DIR=../../../themes/

.PHONY: build $(COLOR_VARIANTS) clean

build:
	for variant in Light Dark Darkest; \
	do \
		mkdir -p $(THEMES_DIR)Flat-Remix-$$variant-XFWM/xfwm4/ ; \
		mkdir -p $(THEMES_DIR)Flat-Remix-$$variant-XFWM-HiDPI/xfwm4/ ; \
		mkdir -p $(THEMES_DIR)Flat-Remix-$$variant-XFWM-xHiDPI/xfwm4/ ; \
		for asset in $(ASSETS) ; \
		do \
			echo ; \
			echo Rendering $$asset.png ; \
			$(INKSCAPE) --export-id=$$asset \
			            --export-id-only \
			            --export-filename=$(THEMES_DIR)Flat-Remix-$$variant-XFWM/xfwm4/$$asset.png \
			            Assets-$$variant.svg > /dev/null 2>&1 \
			&& $(OPTIPNG) $(THEMES_DIR)Flat-Remix-$$variant-XFWM/xfwm4/$$asset.png ; \
			echo ; \
			echo Rendering $$asset.png @1.5; \
			$(INKSCAPE) --export-id=$$asset \
			            --export-dpi=138 \
			            --export-id-only \
			            --export-filename=$(THEMES_DIR)Flat-Remix-$$variant-XFWM-HiDPI/xfwm4/$$asset.png \
			            Assets-$$variant.svg > /dev/null 2>&1 \
			&& $(OPTIPNG) $(THEMES_DIR)Flat-Remix-$$variant-XFWM-HiDPI/xfwm4/$$asset.png ; \
			echo ; \
			echo Rendering $$asset.png @2 ; \
			$(INKSCAPE) --export-id=$$asset \
			            --export-dpi=192 \
			            --export-id-only \
			            --export-filename=$(THEMES_DIR)Flat-Remix-$$variant-XFWM-xHiDPI/xfwm4/$$asset.png \
			            Assets-$$variant.svg > /dev/null 2>&1 \
			&& $(OPTIPNG) $(THEMES_DIR)Flat-Remix-$$variant-XFWM-xHiDPI/xfwm4/$$asset.png ; \
		done ; \
	done

clean:
