#!/bin/sh

sketchybar --set $NAME label="$(df -H | grep '/dev/disk3s5' | awk '{print $5}')"
