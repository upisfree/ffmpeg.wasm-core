#!/bin/bash

set -eo pipefail

SCRIPT_ROOT=$(dirname $0)/wasm/build-scripts

run() {
  for name in $@; do
    $SCRIPT_ROOT/$name.sh
  done
}

run-all() {
  SCRIPTS=(
    # install dependencies
    # install-deps
		#####build-zlib
		#####build-x264
		#####build-libvpx
		#####build-fdk-aac
		configure-ffmpeg
    build-ffmpeg
    # configure-ffmpeg.mp4-scale
    # build-ffmpeg.mp4-scale
    # configure-ffmpeg.png-to-mp4
    # build-ffmpeg.png-to-mp4
  )
  run ${SCRIPTS[@]}
}

main() {
  # verify Emscripten version
  emcc -v
  if [[ "$@" == "" ]]; then
    run-all
  else
    run "$@"
  fi
}

main "$@"
