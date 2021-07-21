#!/bin/bash
# Stream a test
ffmpeg -r 30 -f lavfi -i testsrc -vf scale=1280:960 -vcodec libx264 -profile:v baseline -pix_fmt yuv420p -f flv rtmp://orko:1935/live/test

#Save what is being streamed
rtmpdump -v -r rtmp://localhost/live/test -o dump.flv

# SSH Stream from UEO via SSH displayed to orko as mplayer
ssh pi@ueo ffmpeg -an -f video4linux2 -s 640x480 -i /dev/video0 -r 1 -b:v 500k -f matroska - | mplayer - -idle -demuxer matroska


# Trying to save using tee - SSH Stream from UEO via SSH displayed to orko as mplayer
ssh pi@ueo ffmpeg -an -f video4linux2 -s 640x480 -i /dev/video0 -r 1 -b:v 500k -f matroska - |  tee 'stream_'"$(date +%Y-%m-%d_%H-%M-%S)"'_recording.mkv' | mplayer - -idle

