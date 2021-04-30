from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod3"
mod4 = "mod4"

terminal = "st"
secondaryTerminal = "qterminal"
def latest_group(qtile):
    qtile.current_screen.set_group(qtile.current_screen.previous_group)

keys = [
    Key([mod], "n", lazy.layout.next()),
    Key([mod], "p", lazy.layout.previous()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], 'period', lazy.next_screen(), desc='Next monitor'),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    Key([mod], "b", lazy.function(latest_group)),
    # Personal configs
    # Terminal
    Key([mod4], "t", lazy.spawn(secondaryTerminal)),
    # Browsers
    Key([mod], "q", lazy.spawn("qutebrowser")),
    Key([mod], "x", lazy.spawn("firefox")),
    Key([mod], "g", lazy.spawn("google-chorme")),
    Key([mod, "shift"], "b", lazy.spawn("brave")),
    # Vim
    Key([mod], "v", lazy.spawn(terminal + ' -e nvim /home/aedigo/.vimwiki/index.md')),
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
    Key([mod, "shift"], "s", lazy.spawn("shutboot shut")),
    Key([mod4, "shift"], "p", lazy.spawn("reboot")),
    Key([mod, "control"], "t", lazy.spawn("getHours")),
    # Lock
    Key([mod, "control"], 'l', lazy.spawn("lockIt")),

    # Terminal Based Apps
    Key([mod, "shift"], "r", lazy.spawn(terminal + " -e ttrv")),
]

# Drag floating layouts.
mouse = [
    Drag([mod4], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod4], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod4], "Button2", lazy.window.bring_to_front())
]

