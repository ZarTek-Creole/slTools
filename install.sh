#!/usr/bin/env bash
	install -m 755 -d /opt/sltools
	install -m 755                          \
        opt/sltools/sltools			        \
        opt/sltools/sltools-core	        \
        opt/sltools/sltools-functions       \
        /opt/sltools

	install -m 755 -d /etc/slftp
	install -m 755                  \
        etc/slftp/sltools.cfg.dist  \
        /etc/slftp/

	[ -L /usr/bin/sltools ] && unlink /usr/bin/sltools
	ln -s /opt/sltools/sltools /usr/bin/

	[ -L /usr/bin/sltools-core ] && unlink /usr/bin/sltools-core
	ln -s /opt/sltools/sltools-core /usr/bin/

	install -m 755 -d /opt/src
	cp -r opt/src/fpc /opt/src/
	cp -r opt/src/slftp /opt/src/

	touch /var/log/sltools.log
	chmod 755 /var/log/sltools.log


	cd locale || exit
	for translation in */LC_MESSAGES/sltools.mo; do
		LOCALE=$(echo -n "$translation" | cut -d/ -f1)
		install -Dm 644 "$LOCALE/LC_MESSAGES/sltools.mo" "/usr/share/locale/$LOCALE/LC_MESSAGES/"
	done



	echo "*-----------------------------------------*"
	echo "* SL-Tools a été installé                 *"
	echo "* le répertoire de configuration se       *"
	echo "* trouve dans /etc/slftp et doit être     *"
	echo "* renommé en sltools.cfg                  *"
	echo "* Après vous pouvez éxécuter le programme *"
	echo "* Avec la commande sltools (root/user)    *"
	echo "*-----------------------------------------*"
