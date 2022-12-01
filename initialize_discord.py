#!/usr/bin/env python3

import subprocess

# Start Discord Minimized in Workspace 3
bashCommand = "discord --start-minimized"
process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
output, error = process.communicate()
