# == Dependencies
# Verify that all development dependencies can be found in PATH

DEPENDENCIES = yq tar install crystal gzip dot find markdown
DEPENDENCY_CHECK := $(foreach exec,$(DEPENDENCIES),\
	$(if $(shell which $(exec)),,$(error "No '$(exec)' in PATH")))

# == Functions

app-var = $(shell yq -r .$1 $(APP_YML))
find    = $(shell find $1 -path '$2')

# == Variables

# TODO: Cache into a .make file since this seems to slow down make significantly
NAME            ?= $(call app-var,name)
VERSION         ?= $(call app-var,version)
ARCH            ?= $(shell uname -m)
KERNEL          ?= $(shell uname -s | tr A-Z a-z)

BUILD           ?= build

APP_YML         ?= app.yml

GEN_BUILD       ?= bin
GEN_CR          ?= src/generate.cr
GEN_EXE         ?= $(GEN_BUILD)/generate

TMPL_SRC        ?= templates
TMPL_SOURCES    ?= $(call find,$(TMPL_SRC),*)

OPTIONS_BUILD   ?= src/$(NAME)/helpers
OPTIONS_TMPL    ?= $(TMPL_SRC)/options.cr
OPTIONS_CR      ?= $(OPTIONS_BUILD)/options.cr

DOCS_BUILD      ?= $(BUILD)/doc

README_TMPL     ?= $(TMPL_SRC)/README.md
README_MD       ?= README.md
README_HTML     ?= $(DOCS_BUILD)/README.html

MARKDOWN_SRC    ?= doc
MARKDOWN_MD     ?= $(call find,$(MARKDOWN_SRC),*.md)
MARKDOWN_HTML   ?= $(MARKDOWN_MD:$(MARKDOWN_SRC)/%.md=$(DOCS_BUILD)/%.html)
# TODO: This is weird to have here, prolly unneeded
MARKDOWN_HTML   += $(README_HTML)

LICENSE_TMPL    ?= $(TMPL_SRC)/LICENSE
LICENSE_TXT     ?= LICENSE

SITE_TMPL       ?= $(TMPL_SRC)/index.html
SITE_HTML       ?= index.html

MAKEFILE_TMPL   ?= $(TMPL_SRC)/Makefile
MAKEFILE_SCRIPT ?= $(BUILD)/Makefile

CONFIG_BUILD    ?= $(BUILD)/etc
CONFIG_TMPL     ?= $(TMPL_SRC)/config.yml
CONFIG_YML      ?= $(CONFIG_BUILD)/config.yml

MAN_SRC         ?= doc/man
MAN_BUILD       ?= $(BUILD)/man
MAN_TMPL        ?= $(call find,$(TMPL_SRC),*.roff)
MAN_ROFF        ?= $(MAN_TMPL:$(TMPL_SRC)/%=$(MAN_SRC)/%)
MAN_GZ          ?= $(MAN_ROFF:$(MAN_SRC)/%.roff=$(MAN_BUILD)/%.gz)

API_BUILD       ?= doc/api

DOCS_TARGETS    ?= $(README_MD) $(MARKDOWN_HTML) $(LICENSE_TXT) $(MAN_GZ) $(SITE_HTML) $(API_BUILD)/

GRAPHS_SRC      ?= doc/graphs
GRAPHS_BUILD    ?= $(BUILD)/doc/graphs
GRAPHS_DOT      ?= $(call find,$(GRAPHS_SRC),*.dot)
GRAPHS_PNG      ?= $(GRAPHS_DOT:$(GRAPHS_SRC)/%.dot=$(GRAPHS_BUILD)/%.png)

APP_SRC         ?= src
APP_BUILD       ?= $(BUILD)/bin
APP_CR          ?= $(APP_SRC)/$(NAME).cr $(call find,$(APP_SRC)/$(NAME),*.cr)
APP_EXE         ?= $(APP_BUILD)/$(NAME)

ARCHIVE_BUILD   ?= $(BUILD)/package
ARCHIVE_NAME    ?= $(NAME)-$(KERNEL)-$(ARCH)-$(VERSION)
ARCHIVE_GZ      ?= $(ARCHIVE_BUILD)/$(ARCHIVE_NAME).tar.gz
ARCHIVE_FILES   ?= $(README_HTML) $(DOCS_BUILD)/Contributors.html $(LICENSE_TXT) $(MAKEFILE_SCRIPT) $(MAN_GZ) $(CONFIG_YML)

CLEAN += $(BUILD)
CLEAN += $(GEN_EXE)
CLEAN += $(README_MD) # TODO: Just do DOCS_TARGETS for these below?
CLEAN += $(LICENSE_TXT)
CLEAN += $(SITE_HTML)
CLEAN += $(OPTIONS_CR)

# == Tasks

.PHONY: all build package docs lint clean

all: docs build graphs

package: $(ARCHIVE_GZ)

build: $(APP_EXE)

docs: $(DOCS_TARGETS)

graphs: $(GRAPHS_PNG)

lint:
	./bin/ameba

clean:
	rm -rf $(CLEAN)

# == Rules

# -- Generator

$(GEN_EXE): $(GEN_CR) $(APP_YML) $(TMPL_SOURCES) | $(GEN_BUILD)/
	crystal build -o $@ $<

# -- Options

$(OPTIONS_CR): $(OPTIONS_TMPL) $(GEN_EXE) | $(OPTIONS_BUILD)/
	$(GEN_EXE) $< $@

# -- Readme

$(README_MD): $(README_TMPL) $(GEN_EXE)
	$(GEN_EXE) $< $@

$(README_HTML): $(README_MD) | $(DOCS_BUILD)/
	markdown -f fencedcode,toc -o $@ $<

# -- Markdown Docs

$(DOCS_BUILD)/%.html: $(MARKDOWN_SRC)/%.md | $(DOCS_BUILD)/
	markdown -f fencedcode,toc -o $@ $<

# -- Man Pages

$(MAN_SRC)/%.roff: $(TMPL_SRC)/%.roff $(GEN_EXE) | $(MAN_SRC)/
	$(GEN_EXE) $< $@

$(MAN_BUILD)/%.gz: $(MAN_SRC)/%.roff | $(MAN_BUILD)/
	gzip < $< > $@

# -- API Docs

$(API_BUILD)/:
	crystal docs -p -o $@

# -- License

$(LICENSE_TXT): $(LICENSE_TMPL) $(GEN_EXE)
	$(GEN_EXE) $< $@

# -- Site

$(SITE_HTML): $(SITE_TMPL) $(GEN_EXE)
	$(GEN_EXE) $< $@

# -- Config

$(CONFIG_YML): $(CONFIG_TMPL) $(GEN_EXE) | $(CONFIG_BUILD)/
	$(GEN_EXE) $< $@

# -- Makefile

$(MAKEFILE_SCRIPT): $(MAKEFILE_TMPL) $(GEN_EXE) | $(BUILD)/
	$(GEN_EXE) $< $@

# -- Graphs

$(GRAPHS_BUILD)/%.png: $(GRAPHS_SRC)/%.dot | $(GRAPHS_BUILD)/
	dot -T png -o $@ $<

# -- Application

# TODO: --release
$(APP_EXE): $(APP_CR) $(OPTIONS_CR) | $(APP_BUILD)/
	crystal build -o $@ $<

# -- Archive

$(ARCHIVE_GZ): $(APP_EXE) $(ARCHIVE_FILES) | $(ARCHIVE_BUILD)/
	tar -czf $@ --transform 's/^build\///g' $^

# -- Directories

$(BUILD)/:
	mkdir -p $@

$(GEN_BUILD)/:
	mkdir -p $@

$(OPTIONS_BUILD)/:
	mkdir -p $@

$(MAN_SRC)/:
	mkdir -p $@

$(MAN_BUILD)/:
	mkdir -p $@

$(CONFIG_BUILD)/:
	mkdir -p $@

$(DOCS_BUILD)/:
	mkdir -p $@

$(GRAPHS_BUILD)/:
	mkdir -p $@

$(APP_BUILD)/:
	mkdir -p $@

$(ARCHIVE_BUILD)/:
	mkdir -p $@

