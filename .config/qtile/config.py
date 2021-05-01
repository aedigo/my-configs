from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from keys import keys, mouse
import os, subprocess

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

mod = "mod3"
mod4 = "mod4"

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
        border_width=1,
        border_focus="#fbf1c7",
        border_normal="#282828",
        margin=2,
    ),
    layout.Max(),
]

widget_defaults = dict(
    font='FantasqueSansMono Nerd Font',
    fontsize=14,
    padding=3,
)

extension_defaults = widget_defaults.copy()

def widgets():
    widgetLists = [
                widget.GroupBox(
                    active='a89984',
                    background=bgc,
                    disable_drag=True,
                    highlight_color='fbf1c7',
                    highlight_method='line',
                    inactive='282828',
                ),
                widget.Spacer(
                    background=bgc,
                ),
                widget.Memory(
                    background=bgc,
                    format='{MemUsed}M',
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
                    format='%m/%d %a %H:%M'
                ),
                widget.Sep(
                    background=bgc,
                    foreground=bgc,
                    linewidth=8,
                ),
                widget.QuickExit(
                    background=bgc,
                    default_text='Off',
                    countdown_format='{}',
                ),
            ]
    return widgetLists;

bgc='282828'
screens = [
    Screen(
        top=bar.Bar(
            widgets()
            ,
           20
        ),
    ),
    Screen(
        top=bar.Bar(
            widgets()
            ,
            30
        ),
    ),

]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
        border_width=0,
        max_border_width=0,
        fullscreen_border_width=0,
    float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='steam'),  # ssh-askpass
    Match(wm_class='guake'),  # ssh-askpass
    Match(wm_class='feh'),  # ssh-askpass
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
