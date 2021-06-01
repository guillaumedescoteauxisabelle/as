#
ffmpeg -f image2 -loop 1 -i http://test.dev/overlay.jpg -f flv rtmp://192.168.99.100:1935/live/mystream2

