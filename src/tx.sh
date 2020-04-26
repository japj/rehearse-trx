#!/bin/sh

gst-launch-1.0 \
  autoaudiosrc sync=false ! \
  audioresample quality=9 ! \
  audioconvert ! \
  capsfilter caps="audio/x-raw" ! \
  opusenc bitrate=128000 tolerance=80000000 frame-size=20 complexity=9 inband-fec=true packet-loss-percentage=0 dtx=false ! \
  rtpopuspay ! \
  rtpbin latency=0 .send_rtp_sink_0 ! \
  udpsink host=192.168.2.112 port=51350 \
