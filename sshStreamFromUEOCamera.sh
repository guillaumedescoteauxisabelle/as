#!/bin/bash
ssh pi@ueo ffmpeg -an -f video4linux2 -s 640x480 -i /dev/video0 -r 1 -b:v 500k -f matroska - | mplayer - -idle -demuxer matroska
