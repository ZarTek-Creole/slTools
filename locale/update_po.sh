#!/bin/bash
messagetemplate=sltools.pot
echo "Generating translation template..."



cd $(dirname $0)/..
directory=$PWD
# xgettext will be used on all sh files
find ./opt/sltools -type f  | sort -d -f > locale/POTFILES.in
xgettext \
    --language=Shell \
    --files-from=locale/POTFILES.in \
    --from-code=UTF-8 \
    --output=locale/$messagetemplate \
    --copyright-holder="ZarTeK Creole" --no-wrap --sort-output \
    --add-comments="GETTEXT:" --keyword=m_tr \
    --msgid-bugs-address="ZarTeK.Creole@GMail.com" \
    --package-name="sltools" \
    --package-version="0.0.1" \
    --debug \
    --no-wrap \
    --sort-output \
    --keyword=m_tr || exit 1

cd $directory/locale
#--sort-by-file

sed -i 's/charset=CHARSET/charset=UTF-8/' $messagetemplate
echo "Merging new strings in po files..."

for translation in */LC_MESSAGES/$(basename $messagetemplate .pot).po; do
	echo -n "$translation" | cut -d/ -f1
	# fuzzy matching provides all kinds of interesting results, for example,
	# "NTLM authentication" is translated as "LDAP-Authentifizierung" - thus
	# it is disabled
	msgmerge    --no-fuzzy-matching --no-wrap --update \
                --backup=off "$translation" $messagetemplate
	# dropping obsolete strings
	msgattrib --no-obsolete --no-wrap --sort-output $translation -o $translation
done

for translation in */LC_MESSAGES/$(basename $messagetemplate .pot).po; do
	echo -ne "$translation\t"
	# setting output file to /dev/null so that unneeded messages.mo file
	# is not created
	msgfmt --use-fuzzy -c --statistics -o /dev/null $translation
done