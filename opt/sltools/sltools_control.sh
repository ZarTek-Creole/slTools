[ -z "$sltools_protect" && $sltools_protect != 1] && echo "(Err_003) Reessayer en tapant en consoole : sltools" && exit 1
if [ ! -f /etc/slftp/slftp.cfg ] && echo "(Err_004) Le fichier de slTools suivant est manquant: ' /etc/slftp/slftp.cfg '. Verifier les intructions sur le depot: ' https://github.com/ZarTek-Creole/slTools '." && exit 1
source /etc/slftp/slftp.cfg
[ -z "$slftp_binary_screen" ] && echo "(Err_005) La configuration de 'slftp_binary_screen=<value>' est manquant dans /etc/slftp/sltools.cfg" && exit 1
[ -z "$slftp_binary_name" ] && echo "(Err_006) La configuration de 'slftp_binary_name=<value>' est manquant dans /etc/slftp/sltools.cfg" && exit 1
[ -z "$slftp_screen_name" ] && echo "(Err_007) La configuration de 'slftp_screen_name=<value>' est manquant dans /etc/slftp/sltools.cfg" && exit 1
[ -z "$slftp_restart_onfailure" ] && echo "(Err_008) La configuration de 'slftp_restart_onfailure=<value>' est manquant dans /etc/slftp/sltools.cfg" && exit 1
[ -z "$slftp_directory" ] && echo "La configuration de 'slftp_directory=<value>' est manquant dans /etc/slftp/sltools.cfg" && exit 1
[ -z "$slftp_start_reset_files" ] && echo "(Err_009) La configuration de 'slftp_start_reset_files=<value>' est manquant dans /etc/slftp/sltools.cfg" && exit 1
[ -z "$lftp_unix_user" ] && echo "(Err_010) La configuration de 'lftp_unix_user=<value>' est manquant dans /etc/slftp/sltools.cfg" && exit 1
[ -z "$slftp_unix_group" ] && echo "(Err_011) La configuration de 'slftp_unix_group=<value>' est manquant dans /etc/slftp/sltools.cfg" && exit 1
