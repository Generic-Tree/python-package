"""
CLI commands

This file declares available commands.
See https://docs.openstack.org/cliff/latest/reference/index.html#cliff.command.Command.
"""
from cliff.command import Command


# Create your commands here


class Example(Command):
    """A simple command that prints a message."""

    def get_parser(self, prog_name):
        parser = super(Example, self).get_parser(prog_name)
        parser.add_argument('argument', nargs='?', default='.')
        return parser

    def take_action(self, parsed_args):
        self.app.stdout.write(f'This is the command execution output: {parsed_args.argument}\n')
