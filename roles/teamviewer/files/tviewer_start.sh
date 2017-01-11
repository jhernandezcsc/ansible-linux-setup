#!/bin/bash

export DISPLAY=":0.0"

# Accept Teamviewer license
sudo teamviewer license accept

sudo teamviewer daemon stop

# Enable Teamviewer autostart with system
sudo cp -v /opt/teamviewer/tv_bin/script/teamviewerd.sysv /etc/init.d/

sudo chmod 755 /etc/init.d/teamviewerd.sysv
sudo update-rc.d teamviewerd.sysv defaults

# Enable Teamviewer daemon
sudo teamviewer daemon start
sudo service teamviewerd.sysv start



