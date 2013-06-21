#!/bin/sh

# $1 = message to print
print_header()
{
    echo "== $1 =="
}

function _eval()
{
    if [[ $DRY_RUN ]]; then
        echo "$*"
        return 0
    fi
    eval "$@"
}

function report_error()
{
    echo "[ERROR] $@" >&2
}


