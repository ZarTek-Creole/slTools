#!/usr/bin/env bash
	install -m 755 -d /opt/sltools
	install -m 755                          \
        opt/sltools/sltools_join.sh         \
        opt/sltools/sltools_run_screen.sh   \
        opt/sltools/sltools_run_slftp.sh    \
        opt/sltools/sltools_run.sh          \
        /opt/sltools/;
	install -m 755 -d /etc/slftp
	install -m 755                  \
        etc/slftp/sltools.cfg.dist  \
        /etc/slftp/

	install -m 755      \
        usr/bin/sltools \
        /usr/bin/

	install -m 755 -d /opt/src
	cp -r opt/src/fpc /opt/src/
	cp -r opt/src/slftp /opt/src/

	echo "*-----------------------------------------*"
	echo "* SL-Tools à été installé                 *"
	echo "* le répertoire de configuration se       *"
	echo "* trouve dans /etc/slftp et doit être     *"
	echo "* renommé en sltools.cfg                  *"
	echo "* Après vous pouvez éxécuter le programme *"
	echo "* Avec la commande sltools (root/user)    *"
	echo "*-----------------------------------------*"
