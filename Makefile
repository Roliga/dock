PREFIX := /usr
DESTDIR :=

default:
	@echo "Use 'make install' or 'make uninstall'"

install:
	install -Dm755 dock $(DESTDIR)$(PREFIX)/bin/dock

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dock
