PREFIX := /usr
DESTDIR :=

default:
	@echo "Use 'make install' or 'make uninstall'"

install:
	install -Dm755 dock $(DESTDIR)$(PREFIX)/bin/dock
	install -Dm644 bash-completion $(DESTDIR)$(PREFIX)/share/bash-completion/completions/dock

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dock
	rm -f $(DESTDIR)$(PREFIX)/share/bash-completion/completions/dock
