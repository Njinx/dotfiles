#!/bin/sh

rofi_out=$(ls -ld $HOME/.screenlayout/* | awk '{print $NF}' | awk -F '/' '{print $NF}' | rofi -dmenu)

/bin/sh $HOME/.screenlayout/$rofi_out
