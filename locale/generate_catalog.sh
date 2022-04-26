#!/bin/bash
while read pofile; do
echo "msgfmt --use-fuzzy -c -o ${pofile%po}mo ${pofile} "
        msgfmt --use-fuzzy -c -o ${pofile%po}mo ${pofile} || exit $?
done < <(find $(dirname $0) -type f ! -wholename '*/.svn*' -name '*.po')
