import functools
from cement import ex


def log_command_call(logger, command, debug=None, suppress_output=None, __controller_namespace__=None, __dispatch__=None, **kwargs):
    command = command or '_default'
    dispatch = __dispatch__ or f'{__controller_namespace__}.{command}'

    log = f'\n[COMMAND CALL] {dispatch}:\n  '
    log += '\n  '.join([f'{key}: <{type(value).__name__}> {value}' for key, value in kwargs.items()])
    logger.debug(log)


def expose(*args, **kwargs):
    def wrapper(command):
        @functools.wraps(command)
        def exposed(self):
            parsed_args = vars(self.app.pargs)
            # self.app.log.debug(
            #     f'\n\tcommand: {command.__name__}'
            #     f'\n\tcontroller: {parsed_args.get("__controller_namespace__")}'
            # )
            log_command_call(self.app.log, **parsed_args)
            return command(self)

        return ex(*args, **kwargs)(exposed)
    return wrapper
