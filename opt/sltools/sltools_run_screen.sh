#!/usr/bin/env bash
# !!! don't touch | ne pas toucher !!!
[ -z "$sltools_protect" && $sltools_protect != 1] && echo "(Err_003) Reessayer en tapant en consoole : sltools" && exit 1
slftp_screen_list=`$slftp_binary_screen -ls`
slftp_screen_exec="$slftp_binary_screen -d -m -S $slftp_screen_name bash -c \"cd $slftp_directory; ./slftp_run_loop.sh\""
echo "Run $(pwd)/sltools_run_screen.sh"
if [[ $slftp_screen_list = *$slftp_screen_name* ]]
then
        echo "(Err_001) slFTP: Already running."
else
        $slFTP_Screen
        retVal=$?
        if [ $retVal -ne 0 ]; then
                echo "(Err_002) Error"
                exit 1
        fi
        echo "slFTP: exec \"$slftp_screen_exec'\" done."
fi