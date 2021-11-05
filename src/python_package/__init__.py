# Package root module
#
# This file makes Python to treat its directory as a package
# See https://docs.python.org/3.10/tutorial/modules.html#packages.


PACKAGE_NAME = __name__.rsplit('.')[-1].replace('_', '-')
