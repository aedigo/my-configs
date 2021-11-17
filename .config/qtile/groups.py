from libqtile.lazy import lazy
from libqtile.config import Group, Key, ScratchPad, DropDown
from keys import keys
from modkey import mod, alt

groups = [
    Group('a'),
    Group('s'),
    Group('d'),
    Group('f'),
    Group('h'),
    Group('j'),
    Group('k'),
    Group('l'),
]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
          desc="Switch to group {}".format(i.name)),
        Key([alt], i.name, lazy.window.togroup(i.name),
          desc="move focused window to group {}".format(i.name)),
        Key([mod], 'u', lazy.group["scratchpad"].dropdown_toggle('term')),
    ])

groups.append(
    ScratchPad("scratchpad", [
        DropDown("term", "alacritty", opacity=0.8),
        ]),
)

