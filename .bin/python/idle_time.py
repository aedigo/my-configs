import subprocess

def get(cmd):
        return subprocess.Popen(["/bin/bash", "-c", cmd], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True)

get_idleTime = "dbus-send --print-reply --dest=org.gnome.Mutter.IdleMonitor /org/gnome/Mutter/IdleMonitor/Core org.gnome.Mutter.IdleMonitor.GetIdletime"

idleTime = int((get(get_idleTime)).communicate()[0].rsplit(None,1)[-1])

print(idleTime)
