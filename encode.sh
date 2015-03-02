#!/bin/bash
pushd $(dirname "${BASH_SOURCE[0]}")
rm -f *.log *.webm
filename=$(<val-filename)
humanstart=$(<val-humanstart)
outname=$(basename "$filename")
outname="${outname%.*} [$humanstart]"
ln -s "$outname".webm clip.webm
ffmpeg -i clip.mkv -crf 10 -b:v 4M -speed 0 -an -pass 1 -f webm -y /dev/null
ffmpeg -i clip.mkv -crf 10 -b:v 4M -speed 0 -an -pass 2 -metadata title="$outname" clip.webm
popd

