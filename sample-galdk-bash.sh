#!/bin/bash
#on the host
/a/bin/galdk-bash.sh /a/lib/results/gia-ds-DavidBouchardGagnon-v01a-210510/dbg_v01/1024x /a/lib/results/gia-ds-DavidBouchardGagnon-v01a-210510/dbg_v01/1024x__gal

# on the docker container
/a/bin/gallery_html_maker2.sh /input/ /output/ "gal dbg jg"  "gal dbg jg" "gal dbg jg"

