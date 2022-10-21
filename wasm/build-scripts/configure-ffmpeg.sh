#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-all
  --enable-gpl            # required by x264
  --enable-nonfree        # required by fdk-aac

  --enable-avcodec
  --enable-avformat
  --enable-avfilter
  --enable-swresample
  --enable-swscale
    
  --enable-decoder=pcm_f32le
  --enable-encoder=aac
  --enable-parser=h264
  --enable-protocol=file
  --enable-demuxer=matroska,aac
  --enable-muxer=mp4,webm,aac
  --enable-filter=anull,acopy,aformat,aresample
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"