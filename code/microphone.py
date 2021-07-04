# from talon import actions
# from talon import app
#
# from talon.lib import cubeb
#
# PREFERRED_MICROPHONES = "Sennheiser DECT"
#
#
# def mic_changed_to(device):
#     print("mic_changed_to", device)
#     # if device and device_name(device) not in PREFERRED_MICROPHONES:
#     #     actions.speech.set_microphone("None")
#
#
# app.register("mic_change", mic_changed_to)
#
# ctx = cubeb.Context()
#
#
# def devices_changed():
#     print("devices_changed")
#     device_names = [dev.name for dev in ctx.inputs()]
#     for device_name in device_names:
#         if device_name in PREFERRED_MICROPHONES:
#             print(f"Setting microphone to {device_name}")
#             actions.speech.set_microphone(device_name)
#             actions.speech.enable()
#             return
#     print(f"Setting microphone to None")
#
# actions.speech.set_microphone("None")
# actions.speech.set_microphone("Sennheiser DECT")
#
#
# app.register("devices_changed", devices_changed)
#
# # at startup, disable speech recognition if no preferred microphone connected
# app.register("launch", lambda: devices_changed())
