# Python Package
> This intend to be an [readme-documented][-0], [open-source-licensed][-1], [semantic-versioned][-2],
[conventional-committed][-3] and [changelogged][-4] git repository starting point 
for the development of a brand-new python package

A straightforward beginning for an open-source python package project repository

[-0]: https://www.makeareadme.com/ "Make a README"
[-1]: https://choosealicense.com/licenses/ "Choose a License"
[-2]: https://semver.org/ "Semantic Versioning"
[-3]: https://www.conventionalcommits.org/en/v1.0.0/ "Conventional Commits"
[-4]: https://keepachangelog.com/en/1.0.0/ "Keep a Changelog"
[-5]: https://github.com/RichardLitt/standard-readme/blob/master/spec.md "Standard readme specification"
[-6]: https://www.repostatus.org "Repo maintenance status"

Beside brings [PyPA packing][1] file system structure,
smart environment-consumer [setuptools script][2] base
and useful Makefile targets to help development process,
it also provides publish-on-push automation through
PyPA's official [pypi-publish][3] github action.

[1]: https://packaging.python.org/guides/distributing-packages-using-setuptools/
[2]: https://setuptools.readthedocs.io/en/latest/references/keywords.html
[3]: https://github.com/marketplace/actions/pypi-publish

### Table of Contents
<details>
  <summary>See all</summary>

  * [Getting started](#getting-started)
    * [Development environment](#development-environment)
    * [Continuous delivery](#continuous-delivery)
    * [Repo publication](#repo-publication)
  * [Project specifications](#project-specifications)
    * [Features](#features)
    * [Folder structure](#folder-structure)
  * [Maintenance](#maintenance-)
  * [License](#license-)
    
</details>


## Getting started
First of all, [![create a new repository][B1]][A1] from this template, \
Name it accordingly and place where it best fits for your team.

[B1]: https://img.shields.io/static/v1?label=create%20a%20new%20repository&message=%20&style=social "Create new repository"
[A1]: https://github.com/generic-tree/root/generate "Github repository's template generation URL"

### Development environment
Make sure you have `Git`, `Make` and `Python` installed:

```shell
$ git --version
git version 2.25.1
$ make --version
GNU Make 4.2.1
$ python3 --version
Python 3.8.5
```

Thus, clone the recent-created repository locally,
and set up its development environment:

```shell
$ make init
$ . venv/bin/activate
```

Finally, you are ready to start developing your distributable python modules.

### Continuous delivery
To set up release-and-publish-on-tag automation, you need to have a *Python Package Index* account.
There, [![][B2]][A2] and register it into your fresh-repo [secrets][4]
as `PYPI_API_TOKEN`.

After that, every tagged commit will result in a new version of your package
released at Github and published to PyPI.

[B2]: https://img.shields.io/static/v1?label=create%20an%20API%20token&message=%20&style=social "Create PyPI API token"
[A2]: https://pypi.org/manage/account/token/ "PyPI API token creation URL"
[4]: https://docs.github.com/en/free-pro-team@latest/actions/reference/encrypted-secrets "GitHub Docs: Secrets"

### Repo publication
After all, you should make this project your own: \
Write a good README to present your project to the world. \
And also ensure to tailor the project license to your needs.

[help]: https://gist.github.com/PurpleBooth/109311bb0361f32d87a2 (Check this README template)


## Project specifications
Here some descriptions about this template project:

### Features
This project shortens a repository start setup, considering:

* Inclusion of mature README document, inspired by [Standard Readme][-5]
* Inclusion of open-source LICENSE file
* Inclusion of structured, yet raw, CHANGELOG file
* Compliance with widely-used version control conventions, such as:
    * [Semantic Versioning][-2]
    * [Conventional Commit][-3]
    * [Keep a Changelog][-4]
  
It also powers up python packing workflow by:

* Compliance with [PyPA recommended file structure][1]
* Inclusion of smart `setup.py` script, that:
    * Consumes information from repo, file structure, git, python interpreter and operational system
      to infer most relevant [packing configuration keywords][2]
    * Simplifies creation and includes useful setuptools commands
    * Follows most relevant [PyPA guides][5] instructions
* Inclusion of proficient `Makefile` that improves development management
* Inclusion of appropriate `.gitignore` file
* Inclusion of convenient [Github Actions workflows][6] that:
    * Setup project releases
    * Publish package in PyPI

[5]: https://packaging.python.org/guides/ "PyPA guides"
[6]: https://packaging.python.org/guides/publishing-package-distribution-releases-using-github-actions-ci-cd-workflows/ "Github actions automation"

### Folder structure
```
.
├── .git/                     version control folder
├── .gitignore                ignored files manifest
├── CHANGELOG.md              release notes description
├── LICENSE                   license file
├── Makefile                  development management facilities
├── README.md                 repo presentation document
├── requirements.txt          environment state record
├── setup.py                  python packing script
├── src/                      distributable code root folder
│   ├── <namespace>           package namespace identifier
│   │   └── <package>         python module root folder
│   │       └── __init__.py   python module init script
│   └── scripts/              distributable scripts folder
└── tests/                    package unittest directory
```


## Maintainance [![][B3]][-6]
This project is maintained by the author, [@artu-hnrq](https://github.com/artu-hnrq). \
It has reached a stable, usable state and is being **actively developed**.

[B3]: https://www.repostatus.org/badges/latest/active.svg "Repostatus active badge"


## License [![][B4]][6]
This project is published under the permissions established by [GNU General Public License v3.0][6].

[B4]: https://img.shields.io/github/license/artu-hnrq/Django_GoogleAppEngine_Template?color=green "License badge"
[6]: https://choosealicense.com/licenses/gpl-3.0/ "GPL 3.0 License description"
