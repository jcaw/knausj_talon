from talon import Module
from talon import applescript

mod = Module()


@mod.action_class
class Media:
    def media_set_volume(volume: int):
        """change the volume"""
        applescript.run(f"""set volume output volume {volume}""")
