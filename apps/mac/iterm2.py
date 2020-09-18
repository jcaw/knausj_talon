import json

from talon import actions, Context, Module, resource
from talon_init import TALON_HOME, TALON_PLUGINS, TALON_USER


def load_config_json(filename, default=dict):
    try:
        f = resource.open(filename, "r")
        f.close()
    except FileNotFoundError:
        print("creating missing resource file ", filename)
        with resource.open(filename, "w") as f:
            f.write(json.dumps(default()))
    try:
        return json.load(resource.open(filename))
    except Exception as e:
        print(f"error opening {filename}: {e}")
        return default()


def save_config_json(filename, config):
    with resource.open(filename, "w") as f:
        f.write(json.dumps(config, indent=4))


mod = Module()
ctx = Context()
ctx.matches = r"""
os: mac
app: iTerm2
"""

mod.list("directories", desc="commonly used directories")
ctx.lists["self.directories"] = {
    "up": "..",
    "up up": "../..",
    "up up up": "../../..",
    "up up up up": "../../../..",
    "up up up up up": "../../../../..",
    "home": "~",
    "temp": "/tmp",
    "talon home": str(TALON_HOME),
    "talon user": str(TALON_USER),
    "talon plug-ins": str(TALON_PLUGINS),
    "talon community": "~/.talon/user/talon_community",
}
ctx.lists["self.directories"].update(load_config_json("directory_shortcuts.json"))


mod.list("servers", desc="commonly used servers")
ctx.lists["self.servers"] = load_config_json("servers.json")
print(ctx.lists["self.servers"])

mod.list("pip", desc="pip versions")
ctx.lists["self.pip"] = ("pip", "pip3")

@ctx.action_class("user")
class user_actions:
    def split_number(index: int):
        """change tabs in iterm"""
        actions.key("alt-" + str(index))
