# Package main entry-point
#
# This file enables package to be executed as a python module
# See https://docs.python.org/3/library/__main__.html#main-py-in-python-packages.


import sys
from . import PACKAGE_NAME, __version__


def package_info():
    return f'{PACKAGE_NAME} {__version__}'


def main():
    print(package_info())


if __name__ == '__main__':
    sys.exit(main())
