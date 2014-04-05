#!/bin/bash
pushd $(dirname "${BASH_SOURCE[0]}")
rm -f *.mkv *.ass
start=$(<val-start)
end=$(<val-end)
filename=$(<val-filename)
length=$(python -c 'print('$end-$start')')
rm -rf ~/.fonts/tmp
mkdir ~/.fonts/tmp
pushd ~/.fonts/tmp
ffmpeg -dump_attachment:t "" -i "$filename"
popd
ffmpeg -i "$filename" subs.ass
ffmpeg -ss $start -i "$filename" -t $length -vf colormatrix=bt709:bt601 -c:v ffvhuff -c:a flac -sn clip0.mkv
if [ $(cat subs.ass | wc -c) -eq "0" ]; then
    mv clip0.mkv clip.mkv
else
    ffmpeg -itsoffset $start -i clip0.mkv -vf ass=subs.ass,setpts=PTS-$start -c:v ffvhuff -an video.mkv
    ffmpeg -i video.mkv -i clip0.mkv -c copy clip.mkv
fi
rm -r ~/.fonts/tmp
popd

