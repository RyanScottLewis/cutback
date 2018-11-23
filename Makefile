NAME          ?= cutback

DIR_SRC       ?= src
DIR_BLD       ?= build
DIR_BIN       ?= bin
DIR_TMPL      ?= templates
DIR_DOC       ?= doc
DIR_MAN       ?= $(DIR_DOC)/man
DIR_EMB       ?= $(DIR_SRC)/$(NAME)/embed

MKDIR_EXE     ?= mkdir
MKDIR_FLAGS   ?= -p
MKDIR         ?= $(MKDIR_EXE) $(MKDIR_FLAGS)

MD_EXE        ?= markdown
MD_FLAGS      ?= -f fencedcode,toc
MD            ?= $(MD_EXE) $(MD_FLAGS)

CR_EXE        ?= crystal
CR_FLAGS      ?= build
CR            ?= $(CR_EXE) $(CR_FLAGS)

APP_YML       ?= app.yml shard.yml

find = $(shell find ./$1 -path '$2')

CUTBACK_CR    ?= $(DIR_SRC)/$(NAME).cr $(call find,$(DIR_SRC)/$(NAME),*.cr)
CUTBACK_EXE   ?= $(DIR_BLD)/$(NAME)
#CUTBACK_FLAGS ?= --release # TODO: DONT FORGET ABOUT ME~! CHECK for DEBUG for this

GENERATE_CR   ?= $(DIR_SRC)/generate.cr
GENERATE_EXE  ?= $(DIR_BIN)/generate

README_TMPL   ?= $(DIR_TMPL)/README.md
README_MD     ?= README.md
README_HTML   ?= $(DIR_DOC)/README.html

MAN_EXE_TMPL  ?= $(DIR_TMPL)/$(NAME).1
MAN_EXE_ROFF  ?= $(DIR_MAN)/$(NAME).1

MAN_CFG_TMPL  ?= $(DIR_TMPL)/$(NAME).5
MAN_CFG_ROFF  ?= $(DIR_MAN)/$(NAME).5

HELP_TMPL     ?= $(DIR_TMPL)/help
HELP_OUT      ?= $(DIR_EMB)/help

VERSION_TMPL  ?= $(DIR_TMPL)/version
VERSION_OUT   ?= $(DIR_EMB)/version

TEMPLATES     ?= $(call find,$(DIR_TMPL),*)
DOCS          ?= $(README_MD) $(README_HTML) $(MAN_EXE_ROFF) $(MAN_CFG_ROFF)
EMBEDS        ?= $(HELP_OUT) $(VERSION_OUT)

CLEAN         ?= $(DIR_BLD) $(DIR_MAN) $(DIR_EMB) $(GENERATE_EXE) $(DOCS)

.PHONY: all build docs clean

all: docs build

build: $(GENERATE_EXE) $(CUTBACK_EXE)

docs: $(DOCS)

clean:
	$(RM) -r $(CLEAN)

$(HELP_OUT): $(HELP_TMPL) $(APP_YML) $(GENERATE_EXE) $(DIR_EMB)/
	$(GENERATE_EXE) $< $@

$(VERSION_OUT): $(VERSION_TMPL) $(APP_YML) $(GENERATE_EXE) $(DIR_EMB)/
	$(GENERATE_EXE) $< $@

$(README_MD): $(README_TMPL) $(APP_YML) $(GENERATE_EXE)
	$(GENERATE_EXE) $< $@

$(MAN_EXE_ROFF): $(MAN_EXE_TMPL) $(APP_YML) $(GENERATE_EXE) $(DIR_MAN)/
	$(GENERATE_EXE) $< $@

$(MAN_CFG_ROFF): $(MAN_CFG_TMPL) $(APP_YML) $(GENERATE_EXE) $(DIR_MAN)/
	$(GENERATE_EXE) $< $@

$(README_HTML): $(README_MD) $(DIR_DOC)/
	$(MD) -o $@ $<

$(CUTBACK_EXE): $(CUTBACK_CR) $(TEMPLATES) $(EMBEDS) $(DIR_BLD)/
	$(CR) $(CUTBACK_FLAGS) -o $@ $<

$(GENERATE_EXE): $(GENERATE_CR) $(TEMPLATES) $(DIR_BIN)/
	$(CR) -o $@ $<

$(DIR_BLD)/:
	$(MKDIR) $@

$(DIR_DOC)/:
	$(MKDIR) $@

$(DIR_MAN)/:
	$(MKDIR) $@

$(DIR_BIN)/:
	$(MKDIR) $@

$(DIR_EMB)/:
	$(MKDIR) $@
