# Package main entry-point
#
# This file enables package to be executed as a python module
# See https://docs.python.org/3/library/__main__.html#main-py-in-python-packages.


import sys

from . import PACKAGE_NAME, __version__
from .cli import CommandLineInterface


def main():
    with CommandLineInterface(
        label=PACKAGE_NAME,
        version=__version__,
    ) as app:
        try:
            app.run()

        except AssertionError as e:
            print('AssertionError > %s' % e.args[0])
            app.exit_code = 1

            if app.debug is True:
                import traceback
                traceback.print_exc()


if __name__ == '__main__':
    sys.exit(main())
