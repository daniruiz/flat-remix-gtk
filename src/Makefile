SUBDIRS=$(foreach SUBDIR,cinnamon gtk2 gtk3 metacity xfwm4,assets-renderer/$(SUBDIR)) sass

.PHONY: build $(SUBDIRS) clean

build: $(SUBDIRS)
	$(MAKE) -C templates build

$(SUBDIRS):
	$(MAKE) -C $@ build

clean:
	$(foreach SUBDIR,$(SUBDIRS),$(MAKE) -C $(SUBDIR) clean &&) true
