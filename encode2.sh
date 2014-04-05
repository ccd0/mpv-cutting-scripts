#!/bin/bash
pushd $(dirname "${BASH_SOURCE[0]}")
make clip.webm
if [ -f clip.webm ]; then
    mpv -loop inf clip.webm
else
    zenity --error --text 'Encoding failed'
fi
popd

