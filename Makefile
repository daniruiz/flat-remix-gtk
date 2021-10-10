# GNU make is required to run this file. To install on *BSD, run:
#   gmake PREFIX=/usr/local install

PREFIX ?= /usr
THEMES ?= $(patsubst themes/%/,%,$(wildcard themes/*/))
PKGNAME = flat-remix-gtk
MAINTAINER = Daniel Ruiz de Alegría <daniel@drasite.com>

include src/Makefile.inc

all:

build:
	$(MAKE) -C src build

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/themes
	cp -a $(foreach theme,$(THEMES),themes/$(theme)) $(DESTDIR)$(PREFIX)/share/themes

uninstall:
	-rm -rf $(foreach theme,$(THEMES),$(DESTDIR)$(PREFIX)/share/themes/$(theme))

_get_version:
	$(eval VERSION ?= $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

_get_tag:
	$(eval TAG := $(shell git describe --abbrev=0 --tags))
	@echo $(TAG)

dist: _get_version
	variants="Light Dark"; \
	count=1; \
	for color_variant in $(COLOR_VARIANTS); \
	do \
		for variant in $$variants; \
		do \
			count_pretty=$$(echo "0$${count}" | tail -c 3); \
			(cd themes && tar -c "Flat-Remix-GTK-$${color_variant}-$${variant}" "Flat-Remix-$${variant}"*) | \
				xz -z - > "$${count_pretty}-Flat-Remix-GTK-$${color_variant}-$${variant}_$(VERSION).tar.xz"; \
			count=$$((count+1)); \
		done; \
	done; \

release: _get_version
	$(MAKE) generate_changelog VERSION=$(VERSION)
	$(MAKE) aur_release VERSION=$(VERSION)
	$(MAKE) copr_release VERSION=$(VERSION)
	#$(MAKE) launchpad_release VERSION=$(VERSION)
	git tag -f $(VERSION)
	git push origin --tags
	$(MAKE) dist

aur_release: _get_version _get_tag
	cd aur; \
	sed "s/$(TAG)/$(VERSION)/g" -i PKGBUILD .SRCINFO; \
	git commit -a -m "$(VERSION)"; \
	git push origin master;

	git commit aur -m "Update aur version $(VERSION)"
	git push origin master

copr_release: _get_version _get_tag
	sed "s/$(TAG)/$(VERSION)/g" -i $(PKGNAME).spec
	git commit $(PKGNAME).spec -m "Update $(PKGNAME).spec version $(VERSION)"
	git push origin master

launchpad_release: _get_version
	rm -rf /tmp/$(PKGNAME)
	mkdir -p /tmp/$(PKGNAME)/$(PKGNAME)_$(VERSION)
	cp -a * /tmp/$(PKGNAME)/$(PKGNAME)_$(VERSION)
	cd /tmp/$(PKGNAME)/$(PKGNAME)_$(VERSION) ; \
	sed "s/{}/$(VERSION)/g" -i debian/changelog ; \
	echo " -- $(MAINTAINER)  $$(date -R)" >> debian/changelog ; \
	debuild -S -d ; \
	dput ppa:daniruiz/flat-remix /tmp/$(PKGNAME)/$(PKGNAME)_$(VERSION)_source.changes

generate_changelog: _get_version _get_tag
	git checkout $(TAG) CHANGELOG
	mv CHANGELOG CHANGELOG.old
	echo [$(VERSION)] > CHANGELOG
	printf "%s\n\n" "$$(git log --pretty=format:' * %s' $(TAG)..HEAD)" >> CHANGELOG
	cat CHANGELOG.old >> CHANGELOG
	rm CHANGELOG.old
	$$EDITOR CHANGELOG
	git commit CHANGELOG -m "Update CHANGELOG version $(VERSION)"
	git push origin HEAD

clean:
	-make -C src clean

.PHONY: all build build-sass install uninstall _get_version _get_tag dist release aur_release copr_release launchpad_release generate_changelog clean
