#!/bin/sh

qemu-system-x86_64 \
	-m 128M \
	-cdrom alex_live.iso \
	-boot d \
	-enable-kvm \
	-vga std

