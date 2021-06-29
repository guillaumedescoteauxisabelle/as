#!/bin/bash
# stream images
ffmpeg -f image2 -loop 1 -i http://test.dev/overlay.jpg -f flv rtmp://192.168.99.100:1935/live/mystream2

# Stream and save what is being streamed
ffmpeg -hide_banner -loglevel info -progress /tmp/ffmpeg.log -i udp://10.0.0.150:8181?listen -filter_complex '[0:v]split=2[in1][in2];[in1]scale=640:-1,format=yuv420p[out1];[in2]fps=1/60[out2]' \
-map '[out1]' -map 0:a -framerate 30 -video_size 1080x720 -vcodec libx264 -b:v 768k -crf 23 -preset medium -maxrate 800k -bufsize 800k -g 60 -c:a aac -strict -3 -ar 44100 -ab 32k -f flv rtmp://<ustream url>/<ustream key> \
-map '[out2]' img%03d.jpg
