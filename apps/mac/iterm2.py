import json

from talon import actions, Context, Module, resource
from talon_init import TALON_HOME, TALON_PLUGINS, TALON_USER
from ...code.user_settings import bind_list_to_csv


mod = Module()
ctx = Context()
ctx.matches = r"""
os: mac
app: iTerm2
"""

mod.list("directories", desc="commonly used directories")
_default_directories = {
    "parent": "../",
    "home": "~/",
    "temp": "/tmp",
    "talon home": str(TALON_HOME),
    "talon user": str(TALON_USER),
    "talon plug-ins": str(TALON_PLUGINS),
}
bind_list_to_csv(
    "self.directories",
    "directory_shortcuts.csv",
    csv_headers=("Path", "Spoken Form (If Different)"),
    default_values=_default_directories,
)

mod.list("servers", desc="commonly used servers")
bind_list_to_csv(
    "self.servers", "servers.csv", csv_headers=("Server", " Spoken Form (If Different)")
)

mod.list("pip", desc="pip versions")
ctx.lists["self.pip"] = ("pip", "pip3")

# TODO: Is this action declared, given how I've modified dwiel?
@ctx.action_class
class ContextActions:
    def split_number(index: int):
        """Change tabs in iTerm."""
        actions.key("alt-" + str(index))
