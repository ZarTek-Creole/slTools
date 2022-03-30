#!/usr/bin/env bash
[ -z "$sltools_protect" && $sltools_protect != 1] && echo "(Err_003) Reessayer en tapant en consoole : sltools" && exit 1
slftp_path_run=$slftp_directory/sltools_run_slftp.sh
if [ ! -f $(echo $slftp_path_run) ]
then
    echo "(Err_013) slTools à été mal installer ($slftp_path_run introuvable). verifier les intructions sur le depot: ' https://github.com/ZarTek-Creole/slTools '."
    exit 1
fi

if [ $EUID == 1 ] then 
    su -l $slftp_unix_user -c '$slftp_path_run'
else 
    $slftp_path_run
fi
