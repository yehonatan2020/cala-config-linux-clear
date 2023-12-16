#!/usr/bin/bash

DIR="/etc/calamares"
KERNEL=`uname -r`

if [[ -d "/run/archiso/copytoram" ]]; then
	sudo sed -i -e 's|/run/archiso/bootmnt/arch/x86_64/airootfs.sfs|/run/archiso/copytoram/airootfs.sfs|g' "$DIR"/modules/unpackfs.conf
	sudo sed -i -e "s|/run/archiso/bootmnt/arch/boot/x86_64/vmlinuz-linux-amd-znver2|/usr/lib/modules/$KERNEL/vmlinuz-amd-znver2|g" "$DIR"/modules/unpackfs.conf
fi

sudo pkexec calamares -D8
