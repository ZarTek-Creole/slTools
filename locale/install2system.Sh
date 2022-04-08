#!/bin/bash
for translation in */LC_MESSAGES/sltools.mo; do
    LOCALE=$(echo -n "$translation" | cut -d/ -f1)
	echo $LOCALE
    install -Dm 644 "$LOCALE/LC_MESSAGES/sltools.mo" "/usr/share/locale/$LOCALE/LC_MESSAGES/"
done