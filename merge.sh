#!/bin/bash

VIDEO_URL=$1
AUDIO_URL=$2

curl -L "$VIDEO_URL" -o video.mp4
curl -L "$AUDIO_URL" -o audio.mp3

ffmpeg -i video.mp4 -i audio.mp3 -c:v copy -c:a aac -strict experimental output.mp4

curl --upload-file ./output.mp4 https://transfer.sh/output.mp4
