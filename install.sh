#!/usr/bin/env bash
# Exit on error:
set -o errexit
# exit on fail variable
set -o nounset

# Make sure only root can run our script
[[ $EUID -ne 0 ]] && echo -e "[Error] This script must be run as root!" && exit 1

echo "Installing SL-Tools"
# intsall sltools 
install -m 755 -d /opt/sltools
install -m 755                          \
    opt/sltools/sltools			        \
    opt/sltools/sltools-core	        \
    opt/sltools/sltools-functions       \
    /opt/sltools
echo "SL-Tools create default config file"
# Create default conf
echo "source_dir=$(pwd)" >> etc/sltools/sltools.cfg.dist
install -m 755 -d /etc/sltools
install -m 755                  \
    etc/sltools/sltools.cfg.dist  \
    /etc/sltools/
if [ ! -f "/etc/sltools/sltools.cfg" ]; then
    touch /etc/sltools/sltools.cfg
    chmod 0666 /etc/sltools/sltools.cfg
fi 

echo "SL-Tools Create Symbolic Links"
# create symbolic link
[ -L /usr/bin/sltools ] && unlink /usr/bin/sltools
ln -s /opt/sltools/sltools /usr/bin/

[ -L /usr/bin/sltools-core ] && unlink /usr/bin/sltools-core
ln -s /opt/sltools/sltools-core /usr/bin/

echo "SL-Tools copy internal dependecies"
# install depend internal
install -m 755 -d /opt/src
cp -r opt/src/fpc /opt/src/
cp -r opt/src/slftp /opt/src/

echo "SL-Tools initialisation log file"
if [ ! -f "/var/log/sltools.log" ]; then
    touch /var/log/sltools.log
    chmod 0666 /var/log/sltools.log
fi 

echo "SL-Tools install pack languages"
for LOCALE in $(find locale/ -name sltools.mo | cut -d/ -f2); do
	[ ! -d "/usr/share/locale/${LOCALE}/LC_MESSAGES/" ] && continue
	echo "Install language: ${LOCALE}"
	install -Dm 644 "./locale/${LOCALE}/LC_MESSAGES/sltools.mo" "/usr/share/locale/${LOCALE}/LC_MESSAGES/"
done
echo "SL-Tools Successful installation"
echo "done."

exit 0