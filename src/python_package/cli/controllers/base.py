from cement import Controller


# Controlers are used on `cement` to manage available commands
# See https://docs.builtoncement.com/core-foundation/controllers.
class Base(Controller):
    """
    Application root controller

    It's designed to handle the argument route at runtime
    (argument parsing, mapping sub-commands to controllers, etc)
    """

    # Customize Controler behavior through Meta attributes
    # See https://cement.readthedocs.io/en/3.0/api/ext/ext_argparse/#cement.ext.ext_argparse.ArgparseController.
    class Meta:
        label = 'base'

        # text displayed at the top of --help output
        # description = ''  # TODO

        # The text that is displayed at the bottom when --help is passed
        # epilog = ''  # TODO

        # Arguments to pass to the argument_handler.
        # The format is a list of tuples which items are a ( list, dict )
        arguments = [
            (['-v', '--version'], {'action': 'version'}),
        ]

    def _default(self):
        """Default action if no sub-command is passed."""

        self.app.args.print_help()

    def _pre_argument_parsing(self):
        self._parser.version = self.app.version
