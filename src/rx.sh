#!/bin/sh

# gst-launch-1.0 \
#   udpsrc port=51350 caps="application/x-rtp, media=(string)audio, clock-rate=(int)48000, encoding-name=(string)OPUS, sprop-stereo=(string)0" \
#   rtpbin.recv_rtp_sink_0 \
#   rtpopusdepay \
#   opusdec use-inband-fec=true \
#   audioresample \
#   audioconvert \
#   pulsesink sync=false buffer-time=6

  # udpsrc port=51350 caps="application/x-rtp, media=(string)audio, clock-rate=(int)48000, encoding-name=(string)OPUS, sprop-stereo=(string)0" \

gst-launch-1.0 \
  udpsrc port=51350 caps="application/x-rtp,media=(string)audio,clock-rate=(int)48000,encoding-name=(string)OPUS,sprop-stereo=(string)0" timeout=3000000000 \
  ! .recv_rtp_sink_0 rtpbin latency=4 \
  ! rtpopusdepay \
  ! opusdec \
  ! audioresample \
  ! audioconvert \
  ! pulsesink sync=false buffer-time=6
