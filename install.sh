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

	install -m 755 -d /usr/share/locale/fr/LC_MESSAGES/
	install -m 755      \
        langs/fr/sltools.mo  \
        /usr/share/locale/fr/LC_MESSAGES/

	install -m 755 -d /usr/share/locale/en/LC_MESSAGES/
	install -m 755      \
        langs/en/sltools.mo  \
        /usr/share/locale/en/LC_MESSAGES/

	echo "*-----------------------------------------*"
	echo "* SL-Tools à été installer                *"
	echo "* le repertoire de configuration ce       *"
	echo "* trouve dans /etc/slftp et doit etre     *"
	echo "* renomer en sltools.cfg                  *"
	echo "* Apres vous pouvez executer le programme *"
	echo "* Avec la commande sltools (root/user)    *"
	echo "*-----------------------------------------*"