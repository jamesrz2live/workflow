#!/bin/sh
. ${0%/*}/utils.sh

_eval mv -v /data/aces/source/abengine/tools/abcooker/build/abcooker /data/aces/tools/bin || report_error "Failed to move the abcooker binary (code: $?)."

