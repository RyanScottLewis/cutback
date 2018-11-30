NAME          ?= cutback

DIR_SRC       ?= src
DIR_BLD       ?= build
DIR_BIN       ?= bin
DIR_TMPL      ?= templates
DIR_DOC       ?= doc
DIR_MAN       ?= $(DIR_DOC)/man
DIR_EMB       ?= $(DIR_SRC)/$(NAME)/embed

MKDIR_EXE     ?= mkdir
MKDIR_FLAGS   += -p
MKDIR         ?= $(MKDIR_EXE) $(MKDIR_FLAGS)

MD_EXE        ?= markdown
MD_FLAGS      += -f fencedcode,toc
MD            ?= $(MD_EXE) $(MD_FLAGS)

CR_EXE        ?= crystal
CR_FLAGS      += build
CR            ?= $(CR_EXE) $(CR_FLAGS)

GZ_EXE        ?= gzip
GZ_FLAGS      += -f
GZ_FLAGS      += -k
GZ            ?= $(GZ_EXE) $(GZ_FLAGS)

APP_YML       ?= app.yml shard.yml

find = $(shell find ./$1 -path '$2')

CUTBACK_CR    ?= $(DIR_SRC)/$(NAME).cr $(call find,$(DIR_SRC)/$(NAME),*.cr)
CUTBACK_EXE   ?= $(DIR_BLD)/$(NAME)
ifndef DEBUG
CUTBACK_FLAGS += --release
endif
CUTBACK_DEST  ?= $(DESTDIR)/usr/bin/cutback

GENERATE_CR   ?= $(DIR_SRC)/generate.cr
GENERATE_EXE  ?= $(DIR_BIN)/generate

README_TMPL   ?= $(DIR_TMPL)/README.md
README_MD     ?= README.md
README_HTML   ?= $(DIR_DOC)/README.html

MAN_EXE_TMPL  ?= $(DIR_TMPL)/$(NAME).1
MAN_EXE_ROFF  ?= $(DIR_MAN)/$(NAME).1
MAN_EXE_GZ    ?= $(DIR_MAN)/$(NAME).1.gz
MAN_EXE_DEST  ?= $(DESTDIR)/usr/share/man/man1/$(NAME).1.gz

MAN_CFG_TMPL  ?= $(DIR_TMPL)/$(NAME).5
MAN_CFG_ROFF  ?= $(DIR_MAN)/$(NAME).5
MAN_CFG_GZ    ?= $(DIR_MAN)/$(NAME).5.gz
MAN_CFG_DEST  ?= $(DESTDIR)/usr/share/man/man5/$(NAME).5.gz

HELP_TMPL     ?= $(DIR_TMPL)/help
HELP_OUT      ?= $(DIR_EMB)/help

VERSION_TMPL  ?= $(DIR_TMPL)/version
VERSION_OUT   ?= $(DIR_EMB)/version

TEMPLATES     ?= $(call find,$(DIR_TMPL),*)
DOCS          ?= $(README_MD) $(README_HTML) $(MAN_EXE_GZ) $(MAN_CFG_GZ)
EMBEDS        ?= $(HELP_OUT) $(VERSION_OUT)

CLEAN         ?= $(DIR_BLD) $(DIR_MAN) $(DIR_EMB) $(GENERATE_EXE) $(DOCS)

.PHONY: all build docs clean

all: docs build

build: $(CUTBACK_EXE) $(README_MD)

install: $(CUTBACK_EXE)
	install -m 755 -D $(CUTBACK_EXE) $(CUTBACK_DEST)
	install -m 644 -D $(MAN_EXE_GZ) $(MAN_EXE_DEST)
	install -m 644 -D $(MAN_CFG_GZ) $(MAN_CFG_DEST)

uninstall:
	$(RM) $(CUTBACK_DEST)
	$(RM) $(MAN_EXE_DEST)
	$(RM) $(MAN_CFG_DEST)

docs: $(DOCS)

clean:
	$(RM) -r $(CLEAN)

$(HELP_OUT): $(HELP_TMPL) $(APP_YML) $(GENERATE_EXE)
	@$(MKDIR) $(@D)
	$(GENERATE_EXE) $< $@

$(VERSION_OUT): $(VERSION_TMPL) $(APP_YML) $(GENERATE_EXE)
	@$(MKDIR) $(@D)
	$(GENERATE_EXE) $< $@

$(README_MD): $(README_TMPL) $(APP_YML) $(GENERATE_EXE)
	@$(MKDIR) $(@D)
	$(GENERATE_EXE) $< $@

$(MAN_EXE_ROFF): $(MAN_EXE_TMPL) $(APP_YML) $(GENERATE_EXE)
	@$(MKDIR) $(@D)
	$(GENERATE_EXE) $< $@

$(MAN_EXE_GZ): $(MAN_EXE_ROFF)
	@$(MKDIR) $(@D)
	$(GZ) $<

$(MAN_CFG_ROFF): $(MAN_CFG_TMPL) $(APP_YML) $(GENERATE_EXE)
	@$(MKDIR) $(@D)
	$(GENERATE_EXE) $< $@

$(MAN_CFG_GZ): $(MAN_CFG_ROFF)
	@$(MKDIR) $(@D)
	$(GZ) $<

$(README_HTML): $(README_MD)
	@$(MKDIR) $(@D)
	$(MD) -o $@ $<

$(CUTBACK_EXE): $(CUTBACK_CR) $(TEMPLATES) $(EMBEDS)
	@$(MKDIR) $(@D)
	$(CR) $(CUTBACK_FLAGS) -o $@ $<

$(GENERATE_EXE): $(GENERATE_CR) $(TEMPLATES)
	@$(MKDIR) $(@D)
	$(CR) -o $@ $<

