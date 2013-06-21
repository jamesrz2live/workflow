#!/bin/sh
. ${0%/*}/utils.sh

print_header "Updating Aces Client Bundle"
z2cm-exec aces-update-client-bundle || { echo "[ERROR] Failed to update Aces client bundle." >&2; exit 1; }

print_header "Refreshing Aces Zugs OTA"
z2cm-exec aces-update-ota || { echo "[ERROR] Failed to update Aces zugs OTA." >&2; exit 1; }

echo "Success!"

