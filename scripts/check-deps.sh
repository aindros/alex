#!/bin/sh

# Checks if an application is installed.
check_app()
{
	which $1 2>/dev/null 1>/dev/null
	local result=$?

	echo -n "Checking $1..."

	if [ $result -gt 0 ]; then
		echo 'Not found'
		exit 1
	else
		echo 'Found'
	fi
}

# Checks if a package is installed.
check_pkg()
{
	$pkg | grep $1 2>/dev/null 1>/dev/null
	local result=$?
	echo -n "Checking $1..."

	if [ $result -gt 0 ]; then
		echo 'Not found'
		exit 1
	else
		echo 'Found'
	fi
}

fedora()
{
	check_app gcc
	check_app make
	check_app cpio
	check_app xorriso
	check_pkg glibc-static
}

osname=`cat /etc/os-release | grep ^ID= | sed -E 's/.*=(.*)/\1/'`
osver=`cat /etc/os-release | grep ^VERSION_ID= | sed -E 's/.*=(.*)/\1/g'`

case $osname in
	fedora)
		pkg="dnf list installed"
		fedora
		;;
	freebsd)
		;;
esac

echo
echo 'You can proceed building Alex GNU/Linux'

