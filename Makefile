all: check-deps busybox linux

check-deps:
	scripts/check-deps.sh

clean-all:
	rm -rf kernel.gz

include Makefile.busybox
include Makefile.linux
