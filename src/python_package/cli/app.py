from cement import App

from .controllers import Base


# Use `cement` framework to build a cli structure
# See https://docs.builtoncement.com/getting-started/framework-overview#the-application-object.
class CommandLineInterface(App):
    """Package command line interface"""

    # Customize App behavior through Meta attributes
    # See https://cement.readthedocs.io/en/latest/api/core/foundation/.
    class Meta:
        # The name of the application
        # > Set on package inicialization through __main__
        # label = <package_name>

        # The version of the application
        version = None

        # A handler class that implements the Config interface.
        # See https://docs.builtoncement.com/core-foundation/configuration-settings
        config_handler = 'yaml'

        # Extension used to identify application and plugin configuration files.
        config_file_suffix = '.yml'

        # Default configuration dictionary. Must be of type `dict`
        # config_defaults = None

        # A handler class that implements the Log interface.
        # See https://docs.builtoncement.com/core-foundation/logging-1
        log_handler = 'colorlog'

        # A handler class that implements the Output interface
        # See https://docs.builtoncement.com/core-foundation/output-rendering
        output_handler = 'jinja2'

        # register handlers
        handlers = [
            Base,
        ]

        # List of additional framework extensions to load
        extensions = [
            'colorlog',
            'jinja2',
            'yaml',
        ]

        # Whether (or not) to call sys.exit() when close() is called
        exit_on_close = True

    @property
    def version(self):
        return self._meta.version
