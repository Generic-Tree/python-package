# Development management facilities
#
# This file specifies useful routines to soften development management.
# See https://www.gnu.org/software/make/.


# Tool configuration
SHELL := /bin/bash
GNUMAKEFLAGS += --no-print-directory

# Project identification
# TODO: Single versioning variable
PACKAGE ?= python-package

# File system record
REPO_ROOT ?= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SOURCE_ROOT ?= src
DIST_ROOT ?= dist
VENV_ROOT ?= venv

# Executables definition
PYTHON ?= $(VENV_ROOT)/bin/python3
PIP = $(PYTHON) -m pip
REMOVE = rm -fr


%: # Treat unrecognized targets
	@ echo "No rule to '$(*)'."
	echo "use 'make help' to check available ones."

help:: ## Show this help
	@ egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[3	7;1m%-20s\033[0m %s\n", $$1, $$2}'

init:: veryclean requirements.txt ## Configure development environment
	test -d $(VENV_ROOT) || python3 -m venv $(VENV_ROOT)
	$(PIP) install -r requirements.txt --upgrade
	$(MAKE) install
	$(PIP) freeze
	pre-commit install --install-hooks --overwrite

build:: clean ## Process source code into package distributable artifacts
	$(PYTHON) -m build

install::
	$(PIP) install --editable .

uninstall::
	$(PIP) uninstall $(PACKAGE) -y

clean:: ## Delete all files created through build process
	$(REMOVE) dist/*
	$(REMOVE) **/*.egg-info
	$(REMOVE) build/

veryclean:: uninstall clean ## Delete all generated files
	$(REMOVE) $(VENV_ROOT)
	find $(SOURCE_ROOT) -iname "*.pyc" -iname "*.pyo" -delete
	find $(SOURCE_ROOT) -name "__pycache__" -type d -exec rm -rf {} +


.EXPORT_ALL_VARIABLES:
.ONESHELL:
.PHONY: help init build install uninstall clean veryclean
