#!/bin/bash

while read pofile; do
        msgfmt --use-fuzzy -c -o ${pofile%po}mo $pofile || exit $?
done < <(find $(dirname $0) -type f ! -wholename '*/.svn*' -name '*.po')
msgfmt --use-fuzzy -c -o stools.mo sltools.po