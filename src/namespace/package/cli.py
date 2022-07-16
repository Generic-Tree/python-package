import sys

from . import __version__

from cliff.app import App
from cliff.commandmanager import CommandManager


ENTRYPOINT_NAMESPACE = 'cli.commands'
CLI_DESCRIPTION = 'Command line interface main entrypoint'


class ComandLineInterface(App):
    def __init__(self):
        super(ComandLineInterface, self).__init__(
            description=CLI_DESCRIPTION,
            version=__version__,
            command_manager=CommandManager(ENTRYPOINT_NAMESPACE),
        )


def main(argv=sys.argv[1:]):
    cli = ComandLineInterface()
    return cli.run(argv)


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
