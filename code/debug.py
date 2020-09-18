from talon import actions, speech_system

def fn(d):
    print(d)

speech_system.register('pre:phrase', fn)