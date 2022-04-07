#!/usr/bin/env bash
if [ $EUID == 1 ] then 
    echo "(Err_012) Ne jamais lancer des application internet sous l'utilisateur ROOT!"
    exit 1
fi
function run () {
    cd $slftp_directory
    sleep $restart_wait
    if [ $start_reset_files == 1 ] then 
        rm -f $reset_list
    fi
    ./$slftp_binary_name
}
if [ $slftp_restart_onfailure == 1 ] then 
    while [ 0 == 0 ]
    do
        echo "Press [CTRL+C] to stop.."      
        run
    done
else
    run
fi
