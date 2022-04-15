#!/usr/bin/env bash
# Exit on error:
set -o errexit
# exit on fail variable
set -o nounset

# intsall sltools 
install -m 755 -d /opt/sltools
install -m 755                          \
    opt/sltools/sltools			        \
    opt/sltools/sltools-core	        \
    opt/sltools/sltools-functions       \
    /opt/sltools

# Create default conf
install -m 755 -d /etc/slftp
install -m 755                  \
    etc/slftp/sltools.cfg.dist  \
    /etc/slftp/

# create symbolic link
[ -L /usr/bin/sltools ] && unlink /usr/bin/sltools
ln -s /opt/sltools/sltools /usr/bin/

[ -L /usr/bin/sltools-core ] && unlink /usr/bin/sltools-core
ln -s /opt/sltools/sltools-core /usr/bin/

# install depend internal
install -m 755 -d /opt/src
cp -r opt/src/fpc /opt/src/
cp -r opt/src/slftp /opt/src/

# Init log files
touch /var/log/sltools.log
chmod 0666 /var/log/sltools.log

#Lang install
for LOCALE in $(find locale/ -name sltools.mo | cut -d/ -f2); do
	echo "Install locale : ${LOCALE}"
	install -Dm 644 "./locale/${LOCALE}/LC_MESSAGES/sltools.mo" "/usr/share/locale/${LOCALE}/LC_MESSAGES/"
done
echo "*-----------------------------------------*"
echo "* SL-Tools a été installé                 *"
echo "* le répertoire de configuration se       *"
echo "* trouve dans /etc/slftp et doit être     *"
echo "* renommé en sltools.cfg                  *"
echo "* Après vous pouvez éxécuter le programme *"
echo "* Avec la commande sltools (root/user)    *"
echo "*-----------------------------------------*"
