# Package root module
#
# This file makes Python to treat its directory as a package
# See https://docs.python.org/3.10/tutorial/modules.html#packages.


from .utils.version import get_version


PACKAGE_NAME = __name__.rsplit('.')[-1].replace('_', '-')
PACKAGE_VERSION = (0, 0, 1, "final", 0)

__version__ = get_version(PACKAGE_VERSION)
