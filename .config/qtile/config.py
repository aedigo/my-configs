from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os, subprocess

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

mod = "mod3"
mod4 = "mod4"
terminal = "st"
secondaryTerminal = "qterminal"

keys = [
    # Switch between windows
    #Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    #Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    #Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    #Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "n", lazy.layout.next()),
    Key([mod], "p", lazy.layout.previous()),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    # Key([mod, "control"], "h", lazy.layout.grow_left(),
        # desc="Grow window to the left"),
    # Key([mod, "control"], "l", lazy.layout.grow_right(),
        # desc="Grow window to the right"),
    # Key([mod, "control"], "j", lazy.layout.grow_down(),
        # desc="Grow window down"),
    # Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    # Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    # Personal configs
    # Terminal
    Key([mod4], "t", lazy.spawn(secondaryTerminal)),
    # Browsers
    Key([mod], "q", lazy.spawn("qutebrowser")),
    Key([mod], "x", lazy.spawn("firefox")),
    Key([mod], "g", lazy.spawn("google-chorme")),
    Key([mod, "shift"], "b", lazy.spawn("brave")),
    # Dmenu/Rofi
    Key([mod], "r", lazy.spawn("rofi -show")),
    # Scripts
    Key([mod, "shift"], "e", lazy.spawn("layout")),
    Key([mod, "shift"], "u", lazy.spawn("volume up")),
    Key([mod, "shift"], "d", lazy.spawn("volume down")),
    Key([mod, "shift"], "p", lazy.spawn("pomodoro")),
    Key([mod, "shift"], "c", lazy.spawn("pomodoro cancel")),
    # File Managers
    Key([mod4], "n", lazy.spawn(terminal + " -e nnn")),
    # System
    Key([mod, "shift"], "s", lazy.spawn("shutdown -h now")),
    Key([mod, "shift"], "r", lazy.spawn("reboot")),
    Key([mod, "control"], "t", lazy.spawn("getHours")),
    # Lock
    Key([mod, "control"], 'l', lazy.spawn("betterlockscreen -l dim")),
]

groups = [Group(i) for i in "asdfhjkl"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        #Key([mod4], i.name, lazy.window.togroup(i.name, switch_group=True),
        #    desc="Switch to & move focused window to group {}".format(i.name)),
        # mod1 + shift + letter of group = move focused window to group
        Key([mod4], i.name, lazy.window.togroup(i.name),
             desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.Tile(
        border_width=0,
        margin=4,
    ),
    layout.Max(),
]

widget_defaults = dict(
    font='FantasqueSansMono Nerd Font',
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

bgc='282828'
screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.Sep(
                    background=bgc,
                    foreground=bgc,
                    linewidth=2,
                ),
                widget.GroupBox(
                    active='a89984',
                    background=bgc,
                    disable_drag=True,
                    highlight_color='fbf1c7',
                    highlight_method='line',
                    inactive='fb4934',
                ),
                widget.Spacer(
                    background=bgc,
                ),
               #  widget.OpenWeather(
                    # app_key='2d6602a071d92529af1939b0152f5aba',
                    # cityid='São Vicente, BR',
                # ),
                widget.Memory(
                    background=bgc,
                    format='{MemFree}M',
                ),
                widget.Sep(
                    background=bgc,
                    foreground=bgc,
                    linewidth=8,
                ),
                widget.Systray(
                    background=bgc,
                ),
                widget.Sep(
                    background=bgc,
                    foreground=bgc,
                    linewidth=8,
                ),
                widget.Clock(
                    background=bgc,
                    format='%m/%d %a %I:%M'
                ),
                widget.Sep(
                    background=bgc,
                    foreground=bgc,
                    linewidth=8,
                ),
                widget.QuickExit(
                    background=bgc,
                ),
            ],
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active='a89984',
                    background=bgc,
                    disable_drag=True,
                    highlight_color='fbf1c7',
                    highlight_method='line',
                    inactive='fb4934',
                ),
                widget.Spacer(
                    background=bgc,
                ),
               #  widget.OpenWeather(
                    # app_key='2d6602a071d92529af1939b0152f5aba',
                    # cityid='São Vicente, BR',
                # ),
                widget.Memory(
                    background=bgc,
                    format='{MemFree}M',
                ),
                widget.Sep(
                    background=bgc,
                    foreground=bgc,
                    linewidth=8,
                ),
                widget.Systray(
                    background=bgc,
                ),
                widget.Sep(
                    background=bgc,
                    foreground=bgc,
                    linewidth=8,
                ),
                widget.Clock(
                    background=bgc,
                    format='%m/%d %a %I:%M'
                ),
                widget.Sep(
                    background=bgc,
                    foreground=bgc,
                    linewidth=8,
                ),
                widget.QuickExit(
                    background=bgc,
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
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='steam'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
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
