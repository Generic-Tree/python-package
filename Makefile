# Development management facilities
#
# This file specifies useful routines to streamline development management.
# See https://www.gnu.org/software/make/.


# Tool configuration
SHELL := /bin/bash
GNUMAKEFLAGS += --no-print-directory

# Project identification
PACKAGE_MODULE ?= $(SOURCE_DIR).$(PACKAGE_DIR)
PACKAGE_NAME ?= $(strip $(shell cat $(SETUP_CFG) | grep -Eo 'name = .*' | cut -d'=' -f2))
PACKAGE_VERSION ?= $(strip $(shell python3 -c 'import $(PACKAGE_MODULE) as pkg; print(pkg.__version__)'))

# Path record
REPO_DIR ?= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SOURCE_DIR ?= src
PACKAGE_DIR ?= $(subst -,_,$(PACKAGE_NAME))
DIST_DIR ?= dist
VENV_DIR ?= venv

# Target files
SETUP_CFG = setup.cfg
REQUIREMENTS_TXT ?= requirements-dev.txt

# Executables definition
GIT ?= git
PYTHON ?= $(VENV_DIR)/bin/python3
PIP = $(PYTHON) -m pip
REMOVE = rm -fr


%: # Treat unrecognized targets
	@ printf "\033[31;1mUnrecognized routine: '$(*)'\033[0m\n"
	$(MAKE) help

help:: ## Show this help
	@ printf "\033[33;1mGNU-Make available routines:\n"
	egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[37;1m%-20s\033[0m %s\n", $$1, $$2}'

env:: ## Inicialize virtual environment
	test -d $(VENV_DIR) || python3 -m venv $(VENV_DIR)

init:: veryclean $(REQUIREMENTS_TXT) ## Configure development environment
	$(MAKE) env
	$(PIP) install -r $(REQUIREMENTS_TXT) --upgrade
	$(MAKE) install

build:: clean ## Process source code into package distributable artifacts
	$(PYTHON) -m build

install:: uninstall ## Install on-developing package in current environment
	$(PIP) install --editable .

run:: ## Execute package main entry-point
	$(PYTHON) -m $(PACKAGE_MODULE)

release:: ## Tag commit with current version and push it, triggering release automation
	$(GIT) tag $(PACKAGE_VERSION)
	$(GIT) push origin $(PACKAGE_VERSION)

TWINE_REPOSITORY=testpypi
publish:: build ## Upload distribution archives to python package index
	$(PYTHON) -m twine upload \
		--skip-existing \
		--verbose \
		$(DIST_DIR)/*

uninstall:: ## Uninstall package from current environment
	- $(PIP) uninstall $(PACKAGE_NAME) --yes

clean:: ## Delete all files created through build process
	$(REMOVE) $(DIST_DIR)/*
	$(REMOVE) **/*.egg-info

veryclean:: uninstall clean ## Delete all generated files
	$(REMOVE) $(VENV_DIR)
	find $(SOURCE_DIR) -iname "*.pyc" -iname "*.pyo" -delete
	find $(SOURCE_DIR) -name "__pycache__" -type d -exec rm -rf {} +


.EXPORT_ALL_VARIABLES:
.ONESHELL:
.PHONY: help env init build install run release publish uninstall clean veryclean
