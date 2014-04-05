#!/bin/bash
pushd $(dirname "${BASH_SOURCE[0]}")
make clip.mkv
if [ -f clip.mkv ]; then
    mpv -loop inf clip.mkv
else
    zenity --error --text 'Cutting failed'
fi
popd

