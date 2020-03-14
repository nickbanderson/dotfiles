#!/bin/bash

apps=(
 "termite -e ranger"
 "code dotfiles"
 "chromium"
)

workspaces=(
"9"
"10"
"1"
)

# counter of opened windows
countOpenWindows=0

# add paths of apps to execPath
execPath=( '/usr/bin/' )

for iwin in ${!apps[*]}
do
    while [ "$countOpenWindows" -lt "$iwin" ] # wait before start other programs
    do
        countOpenWindows=$(wmctrl -l | wc -l) # Get number of actual opened windows
    done

    i3-msg workspace ${workspaces[$iwin]} # move in wanted workspace
    ${execPath}/${apps[$iwin]} & # start the wanted app
done

####### ABSOLUTELY OPTIONAL ########
## inject message(s) into terminal (first one created : /dev/pts/0)
# sleep 4 
# script.sh > /dev/pts/0