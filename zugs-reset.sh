#!/bin/sh

. ${0%/*}/utils.sh

print_header "Blobstore Reset"
z2cm-exec sandbox-db-blobstore-clean || { echo "[ERROR] Unable to reset blobstore." >&2; exit 1; }
echo "Success!" # because output from blobstore clean is silent if successful

print_header "Aces Update OTA Content"
z2cm-exec aces-update-ota || { echo "[ERROR] Failed to update Aces OTA content." >&2; exit 1; }
