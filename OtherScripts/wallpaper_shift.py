#!/usr/bin/env python3
import subprocess
import os
import sys
import time

def write_walls(prefsfile, walls):
    # write new set of wallpapers to prefsfile
    open(prefsfile, "wt").write(("\n").join(walls))

def set_wall(wall):
    # set the wallapaper
    new = wall.replace("night:", "").replace("day:", "")
    command = "gsettings set org.gnome.desktop.background picture-uri "+\
              new
    subprocess.Popen(["/bin/bash", "-c", command])

def get_currwal():
    # get the current wallpaper
    return subprocess.check_output([
        "/bin/bash", "-c",
        "gsettings get org.gnome.desktop.background picture-uri"
        ]).decode("utf-8").strip()

def produce_setwalls(prefsfile):
    # on startup of the script, try to read the set wallapapers
    # or take the currently set on first run
    try:
        return open(prefsfile).read().splitlines()
    except FileNotFoundError:
        currwall = get_currwal()
        newwalls = ["night:"+currwall, "day:"+currwall]
        write_walls(prefsfile, newwalls)
        return newwalls

def convert_tosecs(t):
    # convert time of the day (hrs/mins) to seconds
    t = [int(n) for n in t.split(":")]
    return (3600*t[0])+(60*t[1])

# --- set constants
day_period = 24*3600
prefsfile = os.environ["HOME"]+"/.wallset"
# ---

# --- define time- shifts
curr_t = convert_tosecs(time.strftime("%H:%M"))
t1 = convert_tosecs(sys.argv[1])
t2 = convert_tosecs(sys.argv[2])
# ---

# --- define start- data
if any([curr_t > t1, curr_t < t2]):
    curr_term = "night"
    first_period = 86400 - curr_t + t2
else: 
    curr_term = "day"
    first_period = t1 - curr_t
# ---

# --- define time spans
night_shift = 86400 - t1 + t2
day_shift = 86400 - night_shift
# ---

# run first term, set wallpaper according (possible) settings
set_wallpapers = produce_setwalls(prefsfile)
to_set = [wall for wall in set_wallpapers if curr_term in wall][0]
set_wall(to_set)
time.sleep(first_period)

# then start loop
while True:
    if curr_term == "day":
        new_daywall = "day:"+get_currwal()
        sleeptime = night_shift
        new_term = "night"
    elif curr_term == "night":
        new_daywall = "night:"+get_currwal()
        sleeptime = day_shift
        new_term = "day"

    toremove = [item for item in set_wallpapers if curr_term+":" in item][0]
    # replace possibly changed wallpaper in the prefsfile and the currently
    # used set of wallpapers
    set_wallpapers.remove(toremove)
    set_wallpapers.append(new_daywall)
    write_walls(prefsfile, set_wallpapers)
    # switch daytime <> night, set the wallpaper accordingly
    curr_term = new_term
    set_wall([item for item in set_wallpapers if new_term+":" in item][0])
    # sleep again...
    time.sleep(sleeptime)
