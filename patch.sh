#!/bin/sh

dwmver="6.5"

patchlist=$(while IFS= read -r patch; do
	printf '%s\n' "$patch"
done << EOF
dwm-autostart-modified.diff
dwm-flextile-20210722-138b405.diff
dwm-winicon-6.3-v2.1.diff
dwm-moveresize-20221210-7ac106c.diff
dwm-multimon-4-status_all-6.4-modified.diff
dwm-warp-6.4.diff
dwm-bar-height-spacing-6.3-modified.diff
dwm-ipc-6.5-modified.diff
dwm-xresources-6.5-modified.diff
config-SCDF-6.5.diff
EOF
)

if ! [ -d "src/dwm-${dwmver}" ]; then
	printf '%s\n' "[ERR]: Missing sources, are you sure you extracted dwm in the right location?"
	exit 1
fi

for patch in $patchlist; do
	echo "$patch"
	patch -d "src/dwm-${dwmver}" -i "../../Patches/$patch"

	if [ "$?" -ne 0 ]; then
		printf '%s\n' "[ERR]: could not apply patch \`$patch\`, exiting!"
		exit 1
	fi
done
