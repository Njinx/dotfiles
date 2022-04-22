#!/bin/sh

xbacklight -$1 10; notify-send "Brightness [$(xbacklight -get | cut -d'.' -f1)%]" -h string:x-canonical-private-synchronous:anything
