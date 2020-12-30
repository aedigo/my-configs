from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess

mod = "mod3"
terminal = "qterminal"
alternativeTerminal = "alacritty"

backgroundColor = "#002b36"
color = "#268bd2"
alternativeColor = "#268bd2"
action = "#d33682"

keys = [
  # Switch between windows in current stack pane

  Key([mod], "n", lazy.layout.up(),
    desc="Move focus up in stack pane"),
  Key([mod], "b", lazy.layout.down(),
    desc="Move focus down in stack pane"),

  # Move windows up or down in current stack
  Key([mod, "shift"], "o", lazy.layout.shuffle_down(),
    desc="Move window down in current stack "),
  Key([mod, "shift"], "i", lazy.layout.shuffle_up(),
    desc="Move window up in current stack "),

  # Switch window focus to other pane(s) of stack
  Key([mod], "space", lazy.layout.next(),
    desc="Switch window focus to other pane(s) of stack"),

  # Swap panes of split stack
  Key([mod, "shift"], "space", lazy.layout.rotate(),
    desc="Swap panes of split stack"),

  # Toggle between split and unsplit sides of stack.
  # Split = all windows displayed
  # Unsplit = 1 window displayed, like Max layout, but still with
  # multiple stack panes
  Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
    desc="Toggle between split and unsplit sides of stack"),
  Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

  # Toggle between different layouts as defined below
  Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

  Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
  Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
  Key([mod], "r", lazy.spawncmd(),
    desc="Spawn a command using a prompt widget"),

  # Softwares related
  Key([mod, "control"], "c", lazy.spawn(terminal)),
  Key([mod, "control"], "d", lazy.run_extension(extension.DmenuRun(
    dmenu_prompt=">",
    dmenu_font="Andika-8",
    background="#15181a",
    foreground="#00ff00",
    selected_background="#079822",
    selected_foreground="#fff",
    dmenu_height=24,  # Only supported by some dmenu forks
  ))),
  Key([mod, "control"], "f", lazy.spawn("firefox")),
  Key([mod, "control"], "q", lazy.spawn("qutebrowser")),
  Key([mod, "control"], "w", lazy.window.kill(), desc="Kill focused window"),
  Key([mod, "control"], "n", lazy.spawn(terminal + " -e nnn")),
  Key([mod, "control"], "p", lazy.spawn("pomoStart")),
  # Alternative
  Key(['mod4'], "Return", lazy.spawn(alternativeTerminal), desc="Launch backupTerm"),

  # System related
  Key([mod, "shift"], "t", lazy.spawn("shutdown -h now")),
  #Key([mod, "shift"], "j", lazy.spawn("amixer set Master 5%-")),
  Key([mod, "shift"], "j", lazy.spawn("volume down")),
  Key([mod, "shift"], "k", lazy.spawn("volume up")),
  Key([mod, "shift"], "m", lazy.spawn("volume mute")),
  #Key([mod, "shift"], "k", lazy.spawn("amixer set Master 5%+")),
  Key([mod, "shift"], "x", lazy.hide_show_bar("top")),

  # Scripts 
  Key(["mod4", "control"], "l", lazy.spawn("layout")),
  Key(["mod4", "control"], "o", lazy.spawn("pointerDefault")),
  Key(["mod4", "control"], "p", lazy.spawn("pointer")) ,
  Key(["mod4", "control"], "e", lazy.spawn("enableDark")),
  Key(["mod4", "control"], "d", lazy.spawn("disableDark")),
]

groups = [Group(i) for i in "asdfhjkl"]

for i in groups:
  keys.extend([
    # To switch between groups/workspaces
    Key([mod], i.name, lazy.group[i.name].toscreen(),
      desc="Switch to group {}".format(i.name)),

    # This will make the window move and not drag the user with it
    Key(["mod4"], i.name, lazy.window.togroup(i.name),
      desc="move focused window to group {}".format(i.name)),

    ])

layouts = [
  layout.Max(),
  layout.Tile( 
    border_focus = color, 
    border_normal = backgroundColor, 
    border_width = 3, 
    margin = 0,
    expand = True,
  ),
]

widget_defaults = dict(
  font='Iosevka',
  fontsize=16,
  padding=10,
  background = backgroundColor,
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
               widget.GroupBox(
                    borderwidth = 0,
                    highlight_method = 'block',
                    highlight_color = [color, backgroundColor],
                    disable_drag = True,
                ),
                widget.Prompt(),
                widget.Spacer(),
                widget.Sep( 
                    linewidth = 5, 
                    foreground = backgroundColor,
                ),
                widget.Systray(
                    padding = 5,
                ),
                widget.Sep(
                    linewidth = 15,
                    foreground = backgroundColor,
                ),
                widget.QuickExit(
                    background = action,
                    foreground = backgroundColor,
                    default_text = 'Off',
                    countdown_format = "[ {} ]"
                ),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
# Startup script
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

@hook.subscribe.startup
def startup():
    top.show(False)

