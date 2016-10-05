#!/bin/bash

PROJECT="ml-chat-world-of-warships"
BUILD_DIR=build/gui/flash/$PROJECT

set -eo pipefail
mkdir -p $BUILD_DIR
/home/monstrofil/dev/flash/flex/bin/mxmlc -load-config+=$PROJECT.xml -omit-trace-statements -warnings=false -debug=false -incremental=true -swf-version=12 -o $BUILD_DIR.swf

/home/monstrofil/dev/flash/signIt.sh $PWD/$BUILD_DIR/../

python update_game_files.py