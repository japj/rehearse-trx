#!/bin/bash

gst-launch-1.0 -v autoaudiosrc ! audioconvert ! audioresample ! opusenc ! webmmux ! filesink location=latency.webm &

gst-launch-1.0 filesrc location=c5pulse.wav ! decodebin ! audioconvert ! audioresample ! autoaudiosink

kill $!
wait $!
