from libqtile.config import Click, Drag, Key, KeyChord, Match, Screen, ScratchPad, DropDown, Group
from libqtile import bar, layout, widget, hook
import os, subprocess
from libqtile.lazy import lazy
from typing import List  # noqa: F401

mod = 'mod3'
altMod = 'mod4'
term = 'alacritty'
alt_term = 'st'
browser = 'qutebrowser'
sft = 'shift'
ctrl = 'control'
dracula = [
    '282a36',
    'f8f8f2',
    'a89984',
    ]
colors = dracula

def latest_group(qtile):
  qtile.current_screen.set_group(qtile.current_screen.previous_group)

keys = [
    # Window Management
    Key([mod], 'n', lazy.layout.next()),
    Key([mod], 'space', lazy.next_layout()),
    Key([mod], 'p', lazy.layout.previous()),
    Key([mod, ctrl], 'h', lazy.layout.swap_left()),
    Key([mod, ctrl], 'l', lazy.layout.swap_right()),
    Key([mod, ctrl], 'j', lazy.layout.shuffle_down()),
    Key([mod, ctrl], 'k', lazy.layout.shuffle_up()),
    Key([mod, sft], 'h', lazy.layout.left()),
    Key([mod, sft], 'l', lazy.layout.right()),
    Key([mod, sft], 'j', lazy.layout.down()),
    Key([mod, sft], 'k', lazy.layout.up()),
    Key([mod], 'i', lazy.layout.grow()),
    Key([mod], 'o', lazy.layout.shrink()),
    Key([mod], 'c', lazy.window.kill()),

    # Qtile
    Key([mod], 'x', lazy.hide_show_bar("top")),
    Key([mod, ctrl], "r", lazy.restart()),
    Key([mod, ctrl], "c", lazy.reload_config()),

    # Notification
    Key([sft], 'space', lazy.spawn('dunstctl close')),

    # System
    Key([mod, ctrl], 'q', lazy.shutdown()),
    Key([altMod, sft], 'p', lazy.spawn('reboot')),
    Key([altMod, sft], 'l', lazy.spawn('lock-screen')),

    # Terminal
    Key([mod], 't', lazy.spawn(term)),
    Key([altMod], 't', lazy.spawn(alt_term)),

    # Applications
    Key([mod], 'w', lazy.spawn(browser)),
    KeyChord([mod, sft], 'w', [
        Key([], 'o', lazy.spawn('whatsapp-nativefier')),
        Key([], 'c', lazy.spawn('killall WhatsApp')),
      ]),
    Key([mod], 'r', lazy.spawn('dmenu_history -f -i -dim 0.3 -sb "#282a36" -nb "#44475a" -sf "#f8f8f2" -nf "#8be9fd" -fn FantasqueSansMono-12:light')),
    Key([mod], 'v', lazy.spawn('vwhere')),

    # Scripts
    Key([mod, sft], 'e', lazy.spawn('layout')),
    Key([altMod, sft], 's', lazy.spawn('scrot -p -q 100 /home/aedigo/.Pictures/%Y-%m-%d-%T-screenshot.png')),
    Key([mod, sft], 'u', lazy.spawn('volume up')),
    Key([mod, sft], 'd', lazy.spawn('volume down')),
    Key([mod, ctrl], 't', lazy.spawn('getHours')),
    Key([mod, ctrl], 'l', lazy.spawn('lockIt')),
    KeyChord([mod, sft], 'p', [
            Key([], 's', lazy.spawn('pymor -p 20')),
            Key([], 'c', lazy.spawn('pymor -c')),
            Key([], 'r', lazy.spawn('pymor -p 20 -l 3')),
        ]),

    # Terminal Based Apps
    Key([altMod], 'n', lazy.spawn(term + " -t nnn -e nnn")),
    #Key([mod], 'v', lazy.spawn(term + ' -e nvim /home/aedigo/.vimwiki/index.md')),
    Key([mod, sft], 't', lazy.spawn(term + ' -e bpytop')),

    # Others
    Key([mod], 'b', lazy.function(latest_group)),
]

groups = [Group(i) for i in "asdfhjkl"]
for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
          desc="Switch to group {}".format(i.name)),
        Key([altMod], i.name, lazy.window.togroup(i.name),
          desc="move focused window to group {}".format(i.name)),
        Key([mod], 'u', lazy.group["scratchpad"].dropdown_toggle('term')),
    ])

groups.append(
    ScratchPad("scratchpad", [
        DropDown("term", "alacritty -t scratch", height=0.7,
            on_focus_lost_hide=False),
        ]),
)

layouts = [
  layout.MonadTall(
    border_width=1,
    border_focus=colors[1],
    border_normal=colors[0],
    margin=2,
    single_border_width=0,
    single_margin=0,
  ),
  layout.Max(),
]

def open_calendar():
  subprocess.Popen(['calendarPy'])

def widgets():
  widgetLists = [
    widget.GroupBox(
        active=colors[1],
        background=colors[0],
        disable_drag=True,
        highlight_color=colors[1],
        highlight_method='line',
        inactive=colors[0],
        block_highlight_text_color=colors[0],
        margin_y=4,
    ),
    widget.Spacer(
        background=colors[0],
    ),
    widget.DF(
        background=colors[0],
        visible_on_warn=False,
        format='{uf}{m}'
    ),
    widget.DF(
        background=colors[0],
        visible_on_warn=False,
        format='{uf}{m}',
        partition='/home'
    ),
    widget.Sep(
      background=colors[0],
      foreground=colors[0],
      linewidth=0,
    ),
    widget.CPU(
      format='{load_percent}%',
      background=colors[0],
      foreground=colors[1],
    ),
    widget.Sep(
      background=colors[0],
      foreground=colors[0],
      linewidth=0,
    ),
    widget.Memory(
      background=colors[0],
      format='{MemUsed: .0f}{mm}',
    ),
    widget.Sep(
      background=colors[0],
      foreground=colors[0],
      linewidth=0,
    ),
    widget.Systray(
      background=colors[0],
      padding=6,
    ),
    widget.Sep(
      background=colors[0],
      foreground=colors[0],
      linewidth=6,
    ),
    widget.Clock(
      background=colors[0],
      format='%H:%M',
      mouse_callbacks={'Button1': open_calendar}
    ),
  ]
  return widgetLists;

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
  Screen(
    top=bar.Bar(
      widgets(),
      20
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

follow_mouse_focus = True
auto_fullscreen = True
focus_on_window_activation = "smart"
auto_minimize = True
reconfigure_screens = True
bring_front_click = False
cursor_warp = True
wmname = "LG3D"

floating_layout = layout.Floating(
    border_width=0,
    max_border_width=0,
    fullscreen_border_width=0,
    float_rules=[
      *layout.Floating.default_float_rules,
      Match(wm_class='pavucontrol'),
      Match(wm_class='gvim'),
      Match(title='nnn'),
      Match(wm_class='mb_warband_linux'),
      Match(wm_class='whatsapp-nativefier-d40211'),
      ])

@hook.subscribe.startup_once
def autostart():
  home = os.path.expanduser('~')
  subprocess.Popen([home + '/.config/qtile/autostart.sh'])

@hook.subscribe.startup
def startup():
    top.show(False)
