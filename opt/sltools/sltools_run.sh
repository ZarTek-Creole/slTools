#!/usr/bin/env bash
path_run=$slftp_directory/sltools_run_slftp.sh
if [ ! -f $(echo $path_run) ]
then
    echo "(Err_013) SL-Tools à été mal installer ($path_run introuvable). verifier les intructions sur le depot: ' https://github.com/ZarTek-Creole/slTools '."
    exit 1
fi

if [ $EUID == 1 ] then 
    su -l $unix_user -c '$path_run'
else 
    $path_run
fi
