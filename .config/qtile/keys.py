from libqtile.config import Click, Drag, Key, KeyChord
from libqtile.lazy import lazy
from modkey import mod, alt

term = "st"
alt_term = "st"
browser = 'qutebrowser'

def latest_group(qtile):
  qtile.current_screen.set_group(qtile.current_screen.previous_group)

keys = [
    # Window Management
    Key([mod], 'n', lazy.layout.next()),
    Key([mod], 'space', lazy.next_layout()),
    Key([mod], 'p', lazy.layout.previous()),
    Key([mod, 'shift'], 'h', lazy.layout.swap_left()),
    Key([mod, 'shift'], 'l', lazy.layout.swap_right()),
    Key([mod, 'shift'], 'j', lazy.layout.shuffle_down()),
    Key([mod, 'shift'], 'k', lazy.layout.shuffle_up()),
    Key([mod], 'i', lazy.layout.grow()),
    Key([mod], 'o', lazy.layout.shrink()),
    Key([mod], 'c', lazy.window.kill()),



    # Notification
    Key(['shift'], 'space', lazy.spawn('dunstctl close')),

    # System
    Key([mod, 'control'], 'r', lazy.restart()),
    Key([mod, 'control'], 'q', lazy.shutdown()),
    Key([alt, 'shift'], 'p', lazy.spawn('reboot')),

    # Custom functionalities
    Key([mod], 'b', lazy.function(latest_group)),

    # Terminal
    Key([mod], 't', lazy.spawn(term)),
    Key([alt], 't', lazy.spawn(alt_term)),

    # Applications
    Key([mod], 'w', lazy.spawn(browser)),
    Key([mod, 'shift'], 'w', lazy.spawn('whatsapp-nativefier')),
    Key([mod], 'r', lazy.spawn('dmenu_history -h 20')),
    Key([alt], 'p', lazy.spawn('ph type --prog dmenu')),

    # Scripts
    Key([mod, 'shift'], 'e', lazy.spawn('layout')),
    Key([alt, 'shift'], 's', lazy.spawn('scrot -p -q 100 /home/aedigo/Documents/Pictures/%Y-%m-%d-%T-screenshot.png')),
    Key([mod, 'shift'], 'u', lazy.spawn('volume inc')),
    Key([mod, 'shift'], 'd', lazy.spawn('volume dec')),
    Key([mod, 'shift'], 'm', lazy.spawn('volume mute')),
    Key([mod, 'control'], 't', lazy.spawn('getHours')),
    Key([mod, 'control'], 'l', lazy.spawn('lockIt')),
    KeyChord([mod, 'shift'], 'p', [
            Key([], 's', lazy.spawn('pymor -p 20')),
            Key([], 'c', lazy.spawn('pymor -c')),
            Key([], 'r', lazy.spawn('pymor -p 20 -l 3')),
        ]),

    # Terminal Based Apps
    Key([mod, 'shift'], 'r', lazy.spawn(term + " -e ttrv")),
    Key([alt], 'n', lazy.spawn(term + " -e n")),
    Key([mod], 'v', lazy.spawn(term + ' -e nvim /home/aedigo/.vimwiki/index.md')),
    Key([mod, 'shift'], 't', lazy.spawn(term + ' -e gotop')),
]

mouse = [
    Drag([alt], 'Button1', lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([alt], 'Button3', lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([alt], 'Button2', lazy.window.bring_to_front())
]

