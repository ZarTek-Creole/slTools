#!/usr/bin/env bash
[ -z "$sltools_protect" && $sltools_protect != 1] && echo "(Err_003) Reessayer en tapant en consoole : sltools" && exit 1
su -l $lftp_unix_user -c '$slftp_binary_screen -r $slftp_screen_name'
