INITRD=../initrd

all: ${INITRD}/etc
	@mkdir ${INITRD}/dev ${INITRD}/proc ${INITRD}/sys
	cp init       ${INITRD}/

${INITRD}/etc:
	@cp -r etc $@
