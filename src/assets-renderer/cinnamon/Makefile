include ../../Makefile.inc

THEMES_DIR=../../../themes/

.PHONY: build clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$@-Light/cinnamon/assets/
	mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$@-Dark/cinnamon/assets/
	mkdir -p $(THEMES_DIR)Flat-Remix-GTK-$@-Darkest/cinnamon/assets/
	cp assets/* $(THEMES_DIR)Flat-Remix-GTK-$@-Light/cinnamon/assets/
	sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' -i $(THEMES_DIR)Flat-Remix-GTK-$@-Light/cinnamon/assets/*
	cp $(THEMES_DIR)Flat-Remix-GTK-$@-Light/cinnamon/assets/* $(THEMES_DIR)Flat-Remix-GTK-$@-Dark/cinnamon/assets/
	cp $(THEMES_DIR)Flat-Remix-GTK-$@-Light/cinnamon/assets/* $(THEMES_DIR)Flat-Remix-GTK-$@-Darkest/cinnamon/assets/

clean:
