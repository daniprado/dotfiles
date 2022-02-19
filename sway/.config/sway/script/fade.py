#!/usr/bin/env python

import i3ipc

transparency_val = '0.9'
transparency_val_t = '0.8'
opacity_val = '1'
opacity_val_t = '0.95'

ipc = i3ipc.Connection()
prev_focused = None

for window in ipc.get_tree():
    if window.focused:
        prev_focused = window
    else:
        window.command('opacity ' + transparency_val)

def on_window_focus(ipc, focused):
    global prev_focused
    if focused.container.id != prev_focused.id: # https://github.com/swaywm/sway/issues/2859
        focused.container.command('opacity ' + opacity_val)
        if focused.container.ipc_data.get('app_id') == 'Alacritty':
            focused.container.command('opacity ' + opacity_val_t)
        prev_focused.command('opacity ' + transparency_val)
        if prev_focused.ipc_data.get('app_id') == 'Alacritty':
            prev_focused.command('opacity ' + transparency_val_t)
        prev_focused = focused.container

ipc.on("window::focus", on_window_focus)
ipc.main()
