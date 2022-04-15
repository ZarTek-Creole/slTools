#!/usr/bin/env bash
# Exit on error:
set -o errexit
# exit on fail variable
set -o nounset

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
install -m 755 -d /etc/slftp
install -m 755                  \
    etc/slftp/sltools.cfg.dist  \
    /etc/slftp/
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
touch /var/log/sltools.log
chmod 0666 /var/log/sltools.log

echo "SL-Tools install pack languages"
for LOCALE in $(find locale/ -name sltools.mo | cut -d/ -f2); do
	echo "Install language: ${LOCALE}"
	install -Dm 644 "./locale/${LOCALE}/LC_MESSAGES/sltools.mo" "/usr/share/locale/${LOCALE}/LC_MESSAGES/"
done
echo "SL-Tools Successful installation"
