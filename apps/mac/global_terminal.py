
from talon import Module, ui, ctrl, actions

mod = Module()
@mod.action_class
class Actions:
    def shell_rerun():
        """rerun the most recent command in whichever shell as most recently used"""
        # switch_app(name='iTerm2')
        app = ui.apps(bundle="com.googlecode.iterm2")[0]
        ctrl.key_press("c", ctrl=True, app=app)
        actions.sleep("50ms")
        ctrl.key_press("up", app=app)
        ctrl.key_press("enter", app=app)


# def shell_new_server(m):
#     """
#     global command for swtching to iterm, creating a new pain and logging into
#     the specified server
#     """
#     switch_app("iTerm2")
#     new_server(m)
