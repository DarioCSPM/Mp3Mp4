#!/bin/bash
set -e

VIDEO_URL="$1"
AUDIO_URL="$2"
OUTPUT="output.mp4"

echo "Téléchargement de la vidéo..."
curl -L -o video.mp4 "$VIDEO_URL"

echo "Téléchargement de l'audio..."
curl -L -o audio.mp3 "$AUDIO_URL"

echo "Fusion avec ffmpeg..."
ffmpeg -i video.mp4 -i audio.mp3 -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 -shortest "$OUTPUT"

echo "Upload sur transfer.sh..."
UPLOAD_URL=$(curl --upload-file "$OUTPUT" "https://transfer.sh/$OUTPUT")

echo "🔗 Vidéo générée :"
echo "$UPLOAD_URL"
