#!/usr/bin/env bash
if [ $EUID == 1 ] then 
    echo "(Err_012) Ne jamais lancer des application internet sous l'utilisateur ROOT!"
    exit 1
fi
function slftp_run () {
    cd $slftp_directory
    sleep $slftp_restart_wait
    if [ $slftp_start_reset_files == 1 ] then 
        rm -f $slftp_reset_list
    fi
    ./$slftp_binary_name
}
if [ $slftp_restart_onfailure == 1 ] then 
    while [ 0 == 0 ]
    do
        echo "Press [CTRL+C] to stop.."      
        slftp_run
    done
else
    slftp_run
fi
