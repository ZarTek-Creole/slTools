#!/usr/bin/env bash
# !!! don't touch | ne pas toucher !!!
screen_list=$($binary_screen -ls)
screen_exec="$binary_screen -d -m -S $slftp_screen_name bash -c \"cd $slftp_directory; ./run_loop.sh\""
if [[ $screen_list = *$slftp_screen_name* ]]
then
        echo "(Err_001) slFTP: Already running."
else
        $Screen
        retVal=$?
        if [ $retVal -ne 0 ]; then
                echo "(Err_002) Error"
                exit 1
        fi
        echo "slFTP: exec \"$screen_exec'\" done."
fi