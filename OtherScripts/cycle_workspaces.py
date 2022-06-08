#!/usr/bin/env python3
import gi
gi.require_version("Wnck", "3.0")
gi.require_version("Gtk", "3.0")
from gi.repository import Wnck, Gtk

scr = Wnck.Screen.get_default()
scr.force_update()

# list existing workspaces
workspaces = scr.get_workspaces()
# get the (index of) current one
currws = workspaces.index(scr.get_active_workspace())
# since first in list has index 0, subtract 1, if index is last,
# move to first index of the list (workspaces)
if currws == len(workspaces) - 2:
    next_workspace = workspaces[0]
# else pick the next in list
else:
    next_workspace = workspaces[currws + 1]
# and activate it...
next_workspace.activate(Gtk.get_current_event_time())
