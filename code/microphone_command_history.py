from talon.microphone import manager as mic_manager

def fn(*args, **kwargs):
    print(args, kwargs)

mic_manager.register('mic_change', fn)