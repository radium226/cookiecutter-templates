SHELL = /bin/bash
.SHELLFLAGS = -o pipefail -e -c
.ONESHELL:

VERSION = 0.1.0

include make/arch.mk
include make/poetry.mk


.PHONY: clean
clean: arch-clean poetry-clean

.PHONY: install
install: arch-install

.PHONY: test
test: poetry-test
