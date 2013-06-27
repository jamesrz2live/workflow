#!/bin/sh
. ${0%/*}/utils.sh

_eval cp -v /data/minify_json/minify-json.py /data/aces/raw-content/ || exit $?

