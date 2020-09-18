from talon import actions, speech_system, Module

# keeper <user.text>$: insert(text)
# results in: "keeper new-line" inserting an actual new line, instead of the words "new line"

mod = Module()
@mod.action_class
class Actions:
    def keeper_insert(text: str):
        """insert text"""
        print(text)
        actions.insert(text)

        
        # switch_app(name='iTerm2')
# def fn(d):
#     if 'parsed' not in d:
#         return
#
#     print(d['words'])
#     print(d)
#     words = d['parsed']._unmapped
#     if words[0] == 'keeper':
#         actions.insert(' '.join(words[1:]))
#         d['parsed']._sequence = []
#
# speech_system.register('pre:phrase', fn)


"""

"""