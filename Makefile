all: check-deps busybox linux rootfs.gz

check-deps:
	scripts/check-deps.sh

rootfs.gz: initrd
	@cd initrd && find . \
		| cpio -R root:root -H newc -o \
		| gzip > ../rootfs.gz
	@echo $@: creation is completed.

initrd:
	@mkdir -p $@
	@cp -R busybox/_install/* initrd/
	@cp -R etc initrd/
	@rm initrd/linuxrc
	@mkdir initrd/dev initrd/proc initrd/sys
	@cp banner.txt $@/
	@cp init $@/
	@echo initrd: creation is completed.

clean-all: clean
	rm -rf kernel.gz syslinux*

clean:
	rm -rf live* *.iso initrd* rootfs.gz

run-image:
	@scripts/qemu64.sh

include Makefile.busybox
include Makefile.linux
include Makefile.syslinux
