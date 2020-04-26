#!/bin/sh

gst-launch-1.0 -v autoaudiosrc ! audioconvert ! audioresample ! opusenc ! webmmux ! filesink location=audio.webm
