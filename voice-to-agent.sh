#!/bin/bash
# voice-to-agent.sh
# Records your voice, transcribes with Whisper, and types the result into the active window.
#
# Dependencies:
#   sudo apt install arecord ffmpeg wtype wl-clipboard   # Wayland
#   sudo apt install arecord ffmpeg xdotool xclip        # X11
#   pipx install openai-whisper
#
# Usage:
#   ./voice-to-agent.sh          # press Enter to stop recording, then auto-types
#   ./voice-to-agent.sh --clip   # copy to clipboard instead of typing

set -e

AUDIO_FILE="/tmp/voice_input.wav"
MODE="${1:-}"

cleanup() {
  rm -f "$AUDIO_FILE" /tmp/voice_input.*.txt
}
trap cleanup EXIT

echo "🎙️  Recording... Press [Enter] to stop."
arecord -f cd -r 16000 -c 1 "$AUDIO_FILE" 2>/dev/null &
RECORD_PID=$!

read -r  # wait for Enter
kill "$RECORD_PID" 2>/dev/null
wait "$RECORD_PID" 2>/dev/null || true

echo "⏳ Transcribing..."
whisper "$AUDIO_FILE" --language Dutch --model small --output_format txt --output_dir /tmp > /dev/null 2>&1

TRANSCRIPT=$(cat /tmp/voice_input.txt 2>/dev/null | tr -d '\n' | xargs)

if [ -z "$TRANSCRIPT" ]; then
  echo "❌ No speech detected. Try again."
  exit 1
fi

echo "📝 Transcribed: $TRANSCRIPT"

if [ "$MODE" = "--clip" ]; then
  # Clipboard: prefer wl-clipboard (Wayland), fall back to xclip (X11)
  if command -v wl-copy &>/dev/null; then
    echo -n "$TRANSCRIPT" | wl-copy
  else
    echo -n "$TRANSCRIPT" | xclip -selection clipboard
  fi
  echo "📋 Copied to clipboard! Paste with Ctrl+Shift+V."
else
  # Auto-type: prefer wtype (Wayland), fall back to xdotool (X11/XWayland)
  sleep 0.5
  if command -v wtype &>/dev/null && [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    wtype "$TRANSCRIPT"
  else
    xdotool type --clearmodifiers --delay 30 "$TRANSCRIPT"
  fi
fi
