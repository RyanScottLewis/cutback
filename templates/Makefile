NAME            = <%= app.name %>

EXE_SRC         = bin
EXE_DEST        = $(DESTDIR)/usr/bin
EXE_SOURCES     = $(wildcard $(EXE_SRC)/*)
EXE_TARGETS     = $(EXE_SOURCES:$(EXE_SRC)/%=$(EXE_DEST)/%)

DOC_SRC         = doc
DOC_DEST        = $(DESTDIR)/usr/share/doc/$(NAME)
DOC_SOURCES     = $(wildcard $(DOC_SRC)/*)
DOC_TARGETS     = $(DOC_SOURCES:$(DOC_SRC)/%=$(DOC_DEST)/%)

MAN_SRC         = man
MAN_DEST        = $(DESTDIR)/usr/share/man
MAN_1_DEST      = $(MAN_DEST)/man1
MAN_1_SOURCES   = $(wildcard $(MAN_SRC)/*.1.gz)
MAN_1_TARGETS   = $(MAN_1_SOURCES:$(MAN_SRC)/%=$(MAN_1_DEST)/%)
MAN_5_DEST      = $(MAN_DEST)/man5
MAN_5_SOURCES   = $(wildcard $(MAN_SRC)/*.5.gz)
MAN_5_TARGETS   = $(MAN_5_SOURCES:$(MAN_SRC)/%=$(MAN_5_DEST)/%)
MAN_TARGETS     = $(MAN_1_TARGETS) $(MAN_5_TARGETS)

LICENSE_DEST    = $(DESTDIR)/usr/share/licenses/$(NAME)
LICENSE_SOURCES = LICENSE
LICENSE_TARGETS = $(LICENSE_SOURCES:%=$(LICENSE_DEST)/%)

CONFIG_SRC      = etc
CONFIG_DEST     = $(DESTDIR)/etc/xdg/$(NAME)
CONFIG_SOURCES  = $(wildcard $(CONFIG_SRC)/*.yml)
CONFIG_TARGETS  = $(CONFIG_SOURCES:$(CONFIG_SRC)/%=$(CONFIG_DEST)/%)

TARGETS         = $(EXE_TARGETS) $(DOC_DEST) $(LICENSE_DEST) $(MAN_TARGETS) $(CONFIG_TARGETS)

.PHONY: install uninstall

install:
	install -m 755 -D -t $(EXE_DEST) $(EXE_SOURCES)
	install -m 644 -D -t $(DOC_DEST) $(DOC_SOURCES)
	install -m 644 -D -t $(MAN_1_DEST) $(MAN_1_SOURCES)
	install -m 644 -D -t $(MAN_5_DEST) $(MAN_5_SOURCES)
	install -m 644 -D -t $(LICENSE_DEST) $(LICENSE_SOURCES)
	install -m 644 -D -t $(CONFIG_DEST) $(CONFIG_SOURCES)

uninstall:
	rm -rf $(TARGETS)

