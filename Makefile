PKGNAME = flat-remix-gtk
MAINTAINER = Daniel Ruiz de Alegría <daniel@drasite.com>
UBUNTU_RELEASE = jammy
PREFIX ?= /usr
THEMES ?= $(patsubst themes/%/,%,$(wildcard themes/*/))

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
	count=1; \
	for color_variant in $(COLOR_VARIANTS); \
	do \
		count_pretty=$$(echo "0$${count}" | tail -c 3); \
		(cd themes && tar -c Flat-Remix-*-$${color_variant}* Flat-Remix-*-XFWM* Flat-Remix-*-Metacity) | \
			xz -z - > "$${count_pretty}-Flat-Remix-GTK-$${color_variant}_$(VERSION).tar.xz"; \
		count=$$((count+1)); \
	done; \

release: _get_version
	$(MAKE) generate_changelog VERSION=$(VERSION)
	$(MAKE) aur_release VERSION=$(VERSION)
	$(MAKE) copr_release VERSION=$(VERSION)
	#$(MAKE) launchpad_release VERSION=$(VERSION)
	git tag -f $(VERSION)
	git push origin --tags
	$(MAKE) dist

aur_release: _get_version
	cd aur; \
	sed "s/pkgver=.*/pkgver=$(VERSION)/" -i PKGBUILD; \
	sed "s/pkgver =.*/pkgver = $(VERSION)/" -i .SRCINFO; \
	git commit -a -m "$(VERSION)"; \
	git push origin master;

	git commit aur -m "Update aur version $(VERSION)"
	git push origin master

copr_release: _get_version
	sed "/Version:/c Version: $(VERSION)" -i $(PKGNAME).spec
	git commit $(PKGNAME).spec -m "Update $(PKGNAME).spec version $(VERSION)"
	git push origin master

launchpad_release: _get_version
	rm -rf /tmp/$(PKGNAME)
	mkdir -p /tmp/$(PKGNAME)/$(PKGNAME)_$(VERSION)
	cp -a * /tmp/$(PKGNAME)/$(PKGNAME)_$(VERSION)
	cd /tmp/$(PKGNAME)/$(PKGNAME)_$(VERSION); \
	echo "$(PKGNAME) ($(VERSION)) $(UBUNTU_RELEASE); urgency=low" > debian/changelog; \
	echo >> debian/changelog; \
	echo "  * Release $(VERSION)" >> debian/changelog; \
	echo >> debian/changelog; \
	echo " -- $(MAINTAINER)  $$(date -R)" >> debian/changelog; \
	debuild -S -d; \
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
