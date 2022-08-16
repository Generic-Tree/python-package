# Python Package
> This intends to be an [readme-documented][-0], [open-source-licensed][-1], [semantic-versioned][-2],
[conventional-committed][-3] and [changelogged][-4] git repository starting point
for the development of a brand-new python package

A straightforward beginning for an open-source python package project repository

[-0]: https://www.makeareadme.com/ "Make a README"
[-1]: https://choosealicense.com/licenses/ "Choose a License"
[-2]: https://semver.org/ "Semantic Versioning"
[-3]: https://www.conventionalcommits.org/en/v1.0.0/ "Conventional Commits"
[-4]: https://keepachangelog.com/en/1.0.0/ "Keep a Changelog"

[>1]: https://choosealicense.com/licenses/gpl-3.0/ "GPL 3.0 license description"
[>2]: https://www.repostatus.org "Repo maintenance status"
[>3]: https://github.com/RichardLitt/standard-readme/blob/master/spec.md "Standard readme specification"
[>4]: https://packaging.python.org/guides/distributing-packages-using-setuptools/ "PyPA packing instructions"
[>5]: https://setuptools.pypa.io/en/latest/userguide/index.html "Setuptools packing instructions"
[>6]: https://packaging.python.org/en/latest/guides/single-sourcing-package-version/ "Single-sourcing package version"

[!1]: https://github.com/generic-tree/python-package/generate "Github repository's template generation URL"
[!2]: https://pypi.org/manage/account/token/ "PyPI API token creation URL"

[B1]: https://img.shields.io/github/license/Generic-Tree/python-package?color=green "License badge"
[B2]: https://www.repostatus.org/badges/latest/concept.svg "Repostatus active badge"
[B3]: https://img.shields.io/static/v1?label=create%20a%20new%20repository&message=%20&style=social "Create new repository"


### Table of Contents
<details>
  <summary>See all</summary>

  * [Getting started](#getting-started)
    * [Development environment](#development-environment)
    * [Repo publication](#repo-publication)
  * [Project specifications](#project-specifications)
    * [Features](#features)
    * [Folder structure](#folder-structure)
  * [Maintenance](#maintenance-)
  * [License](#license-)

</details>


## Getting started
First of all, [![create a new repository][B3]][!1] from this template, \
Name it accordingly and place where it best fits for your team.

### Development environment
Make sure you have `Git`, `Make` and `Python` installed:

```shell
$ git --version
git version 2.25.1
$ make --version
GNU Make 4.2.1
$ python3 --version
Python 3.10
```

Thus, clone the recent-created repository locally,
and set up its development environment:

```shell
$ make init
$ . venv/bin/activate
```

You're then ready to [start developing your distributable python modules][>4].

### Repo publication
After all, you should make this project your own.
* Write a good `README.md` to present it to the world.
* Ensure to tailor the project `LICENSE` to your needs,
* Assign a suitable maintenance status.
* Update package metadata on `setup.cfg`
* Reflect all this changes in `CHANGELOG.md`


## Project specifications
Here some descriptions about this template project:

### Features
This project shortens a repository start setup, considering:
* Inclusion of a mature README document, inspired by [Standard Readme][>3]
* Inclusion of an open-source LICENSE file
* Inclusion of a structured, yet raw, CHANGELOG file
* Compliance with widely-used version control conventions, such as:
    * [Semantic Versioning][-2]
    * [Conventional Commit][-3]
    * [Keep a Changelog][-4]

It also powers up python packing workflow by:

* Compliance with both [PyPA][>4] and [setuptools][>5] recommendations
* Adopt a PEP 440-compliant [single-source package versioning][>6] strategy
* Inclusion of proficient `Makefile` that improves development management
* Inclusion of appropriate `.gitignore` file
* Commented references and instructions through configuration files

### Folder structure
```
.
├── .git/                       Version control system folder
├── .gitignore                  VCS ignored files manifest
├── CHANGELOG.md                Release notes description
├── LICENSE                     License file
├── Makefile                    Development management facilities
├── pyproject.toml              Development declarative configuration
├── README.md                   Repo readme document
├── requirements.txt            Packing dependence descriptor
├── setup.cfg                   Package declarative configuration
└── src/
    ├── <package>               Python package root folder
    │   └── __init__.py         Python package init script
    └── utils                   Auxiliary functions module
        └── version.py          PEP 440-compliant version management
```


## Maintenance [![][B2]][>2]
This project is maintained by the author, [@artu-hnrq](https://github.com/artu-hnrq). \
Though, minimal or no implementation has been done yet,
it's only intended to be a limited example, demo, or proof-of-concept.


## License [![][B1]][>1]
This project is published under the permissions established by [GNU General Public License v3.0][>1].
