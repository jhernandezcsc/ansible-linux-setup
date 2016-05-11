#!/bin/bash

screen
export DISPLAY=":0.0"

teamviewer

# Accept Teamviewer license
teamviewer license accept

# Enable Teamviewer daemon
sudo cp -v /opt/teamviewer/tv_bin/script/teamviewerd.sysv /etc/init.d/teamviewerd
sudo teamviewer daemon enable
sudo teamviewer daemon start
sudo update-rc.d teamviewerd defaults


