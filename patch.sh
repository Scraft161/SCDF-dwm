#!/bin/sh

dwmver="6.5"

patchlist=$(while IFS= read -r patch; do
	printf '%s\n' "$patch"
done << EOF
dwm-autostart-modified.diff
dwm-flextile-20210722-138b405.diff
dwm-winicon-6.3-v2.1.diff
dwm-xresources-modified.diff
dwm-config-scdf.diff
dwm-ipc-6.5-modified.diff
EOF
)

if ! [ -d "src/dwm-${dwmver}" ]; then
	printf '%s\n' "[ERR]: Missing sources, are you sure you extracted dwm in the right location?"
	exit 1
fi

for patch in $patchlist; do
	echo "$patch"
	patch -d "src/dwm-${dwmver}" -i "../../$patch"
done
