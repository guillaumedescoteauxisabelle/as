#streams but does not save using dump
ffmpeg -r 10 -f video4linux2 -i  /dev/video0 -vf scale=1280:960 -b:v 500k  -vcodec libx264 -profile:v baseline -pix_fmt yuv420p -f flv rtmp://orko:1935/live/ueo

#not working
ffmpeg -r 10 -f lavfi -i  /dev/video0 -vf scale=1280:960 -vcodec libx264 -profile:v baseline -pix_fmt yuv420p -f flv rtmp://orko:1935/live/ueo
