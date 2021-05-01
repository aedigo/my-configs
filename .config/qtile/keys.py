from libqtile.config import Click, Drag, Key 
from libqtile.lazy import lazy

mod = "mod3"
mod4 = "mod4"

terminal = "st"
secondaryTerminal = "qterminal"

def latest_group(qtile):
    qtile.current_screen.set_group(qtile.current_screen.previous_group)

keys = [
    # Windows
    Key([mod], "n", lazy.layout.next()),
    Key([mod], "p", lazy.layout.previous()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod], "space", lazy.next_layout()),
    Key([mod], "c", lazy.window.kill()),

    # System 
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod4, "shift"], "p", lazy.spawn("reboot")),

    # Custom functionalities
    Key([mod], "b", lazy.function(latest_group)),

    # Terminal
    Key([mod], "t", lazy.spawn(terminal)),
    Key([mod4], "t", lazy.spawn(secondaryTerminal)),

    # Browsers
    Key([mod], "q", lazy.spawn("qutebrowser")),
    Key([mod], "x", lazy.spawn("firefox")),
    Key([mod, 'control'], "d", lazy.spawn("firefox-developer-edition")),
    Key([mod], "g", lazy.spawn("google-chorme")),
    Key([mod, "shift"], "b", lazy.spawn("brave")),

    # Dmenu/Rofi
    Key([mod], "r", lazy.spawn("rofi -show")),

    # Scripts
    Key([mod, "shift"], "e", lazy.spawn("layout")),
    Key([mod, "shift"], "u", lazy.spawn("volume up")),
    Key([mod, "shift"], "d", lazy.spawn("volume down")),
    Key([mod, "shift"], "p", lazy.spawn("pomodoro")),
    Key([mod, "shift"], "c", lazy.spawn("pomoCancel")),
    Key([mod, "control"], "t", lazy.spawn("getHours")),
    Key([mod, "control"], 'l', lazy.spawn("lockIt")),

    # Terminal Based Apps
    Key([mod, "shift"], "r", lazy.spawn(terminal + " -e ttrv")),
    Key([mod4], "n", lazy.spawn(terminal + " -e nnn")),
    Key([mod], "v", lazy.spawn(terminal + ' -e nvim /home/aedigo/.vimwiki/index.md')),
]

mouse = [
    Drag([mod4], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod4], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod4], "Button2", lazy.window.bring_to_front())
]

