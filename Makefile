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
	@rm initrd/linuxrc
	@cd init && make
	@cd udhcpc && make
	@echo initrd: creation is completed.

clean-all: clean
	rm -rf syslinux*

clean:
	rm -rf live* *.iso initrd* rootfs.gz kernel.gz

run-image:
	@scripts/qemu64.sh

include Makefile.busybox
include Makefile.linux
include Makefile.syslinux
