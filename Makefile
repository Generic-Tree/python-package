SHELL := /bin/bash

REPO_ROOT ?= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

VENV_ROOT ?= venv
PYTHON ?= $(VENV_ROOT)/bin/python3


help:: ## Show this help
	@ egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[3	7;1m%-20s\033[0m %s\n", $$1, $$2}'

isolate:: ## Guarantee virtual environment is set
	test -d $(VENV_ROOT) || python3 -m venv $(VENV_ROOT)

init:: veryclean | isolate ## Configure the development environment
	$(PYTHON) -m pip install -r requirements.txt

install:: ## Install package
	$(PYTHON) -m pip install -e .

develop:: ## Install package in development mode
	$(PYTHON) -m pip install -e .[dev]

build:: clean ## Process source code into package distributable artifacts
	$(PYTHON) setup.py sdist bdist_wheel

compile:: ## Treat file generation
	$(PYTHON) -m pip freeze > requirements.txt

test:: ## Verify package's behavior requirements completeness

release:: ## Release project new version
	-@ VERSION=$$($(PYTHON) setup.py --version)
	git tag $$VERSION

publish:: ## Publish package on PyPI
	@ test -d dist && \
 	$(PYTHON) -m twine check dist/* && \
	$(PYTHON) -m twine upload dist/* || \
	echo "directory dist doesn't exist, first build"

clean:: ## Delete all files created through Build process
	-$(PYTHON) setup.py clean

veryclean:: clean ## Delete all generated files
	rm -fr venv

check:: ## Check package setup is running correctly
	$(PYTHON) setup.py --name --version


.ONESHELL:
.PHONY: help isolate init install develop build compile test publish clean veryclean check