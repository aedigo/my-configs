from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from keys import keys, mouse
import os, subprocess, numpy
from libqtile.log_utils import logger

logger.warning("Changes:")

@hook.subscribe.startup_once
def autostart():
  home = os.path.expanduser('~')
  subprocess.Popen([home + '/.config/qtile/autostart.sh'])

mod = "mod3"
mod4 = "mod4"

colors = [
  '#282828',
  'fbf1c7',
  'a89984',
]

groups = [Group(i) for i in "asdfhjkl"]

for i in groups:
  keys.extend([
    Key([mod], i.name, lazy.group[i.name].toscreen(),
      desc="Switch to group {}".format(i.name)),
    Key([mod4], i.name, lazy.window.togroup(i.name),
      desc="move focused window to group {}".format(i.name)),
    ])

  layouts = [
      layout.MonadTall(
        border_width=1,
        border_focus=colors[1],
        border_normal=colors[0],
        margin=2,
        single_border_width=0,
        single_margin=0,
        ),
      ]

  widget_defaults = dict(
      font='FantasqueSansMono Nerd Font',
      fontsize=12,
      padding=3,
      )

  extension_defaults = widget_defaults.copy()

def widgets():
  widgetLists = [
      widget.GroupBox(
        active=colors[2],
        background=colors[0],
        disable_drag=True,
        highlight_color=colors[1],
        highlight_method='line',
        inactive=colors[0],
        ),
      widget.Spacer(
        background=colors[0],
        ),
      widget.Memory(
        background=colors[0],
        format='{MemUsed}M',
        ),
      widget.Sep(
        background=colors[0],
        foreground=colors[0],
        linewidth=8,
        ),
      widget.Systray(
        background=colors[0],
        ),
      widget.Sep(
        background=colors[0],
        foreground=colors[0],
        linewidth=8,
        ),
      widget.Clock(
        background=colors[0],
        format='%m/%d %a %H:%M'
        ),
      widget.Sep(
        background=colors[0],
        foreground=colors[0],
        linewidth=8,
        ),
      widget.QuickExit(
        background=colors[0],
        default_text='Off',
        countdown_format='{}',
        ),
      ]
  return widgetLists;

screens = [
    Screen(
      top=bar.Bar(
        widgets()
        ,
        20
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
      *layout.Floating.default_float_rules,
      Match(wm_class='confirmreset'),
      Match(wm_class='makebranch'),
      Match(wm_class='maketag'),
      Match(wm_class='ssh-askpass'),
      Match(wm_class='steam'),
      Match(wm_class='guake'),
      Match(wm_class='feh'),
      Match(title='branchdialog'),
      Match(title='pinentry'),
      ])
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "LG3D"
