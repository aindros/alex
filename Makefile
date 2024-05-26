all: check-deps busybox

check-deps:
	scripts/check-deps.sh

include Makefile.busybox
