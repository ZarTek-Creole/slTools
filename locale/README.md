- [1. Introduction](#1-introduction)
- [2. Prérequis](#2-prérequis)
- [3. Information](#3-information)
- [4. Extraire les strings langue du code](#4-extraire-les-strings-langue-du-code)
- [5. Traduire et corriger les catalogues de langues](#5-traduire-et-corriger-les-catalogues-de-langues)
- [6. Générer les catalogues de langues pour les systèmes](#6-générer-les-catalogues-de-langues-pour-les-systèmes)
- [7. Ajouter une nouvelle langue](#7-ajouter-une-nouvelle-langue)
# 1. Introduction
Ce répertoire ```locale/``` contient les traductions de SL-Tools et les outils pour les manipulations de celles-ci.

Le code source de SL-Tools contient des chaînes(du texte) de langue en anglais par défaut qui est la langue de base.

Ces chaînes sont reconnues dans le code par la fonction "m_tr" (message_translator).

Cette fonction est sous la forme de ```$(m_tr "TEXT %s, %s" "$valeur1" "$valeur2")``` qui respecte le principe de GETTEXT

```TEXT``` étant du texte traductible et les deux ```%s``` étant des variables dynamiques qui prennent la valeur de ```$valeur1``` pour le premier et la valeur de ```$valeur2``` pour le deuxième.

Le résultat affiché sera ```TEXT valeur1, valeur2``` 

Pour plus d'information sur gettext : https://fr.wikipedia.org/wiki/GNU_gettext

# 2. Prérequis
Vous avez besoin que l'outil gettext soit installé sur votre machine ainsi que msgfmt et find.

# 3. Information
Si vous modifiez dans le code une valeur d'un/plusieurs "m_tr" où vous ajoutez de nouveaux textes avec "m_tr":

 Vous devez recréer le catalogue d'origine qui contient les strings (textes) de la langues d'origine qui se trouve dans le code source).

# 4. Extraire les strings langue du code
Exécutez simplement dans le repertoire ```locale/``` l'outil ```extract_str_code.sh```, celui ci va générer un fichier sltools.pot qui sera à jour, ainsi que créer chaque fichiers sltools.po respectifs, pour chaque langues éxistantes

Exemple de fichier générer dans le répertoire ```locale/```:
```
./sltools.pot
./es/LC_MESSAGES/sltools.po,
./fr/LC_MESSAGES/sltools.po,
./nl/LC_MESSAGES/sltools.po,
./pl/LC_MESSAGES/sltools.po 
```

Exemple d'éxécution :
```
$ ./extract_str_code.sh 
Generating translation template...
Merging new strings in po files...
de
................... done.
en
................... done.
es
................... done.
fr
.................... done.
nl
................... done.
pl
................... done.
de/LC_MESSAGES/sltools.po       12 translated messages, 37 fuzzy translations.
en/LC_MESSAGES/sltools.po       49 translated messages.
es/LC_MESSAGES/sltools.po       13 translated messages, 36 fuzzy translations.
fr/LC_MESSAGES/sltools.po       20 translated messages, 29 fuzzy translations.
nl/LC_MESSAGES/sltools.po       11 translated messages, 38 fuzzy translations.
pl/LC_MESSAGES/sltools.po       12 translated messages, 37 fuzzy translations.
```

# 5. Traduire et corriger les catalogues de langues
Ces fichiers peuvent être modifier par vos soins pour réaliser les traductions.

Il est vivement conseiller d'utiliser un outil d'éditage de fichier PO telle que POedit (Win, Mac, Linux).

Pour plus d'informations sur POedit visitez : https://poedit.net/download

- Notez bien qu'il est important de vérifier et de s'assurer que la valeur "Plural-Forms" soit correctement définie.

# 6. Générer les catalogues de langues pour les systèmes
Lors que vos traductions sont correctes, il est temps de générer -à partir des fichier PO- les catalogues de langues systeme.

Pour se faire rien de plus facile, restez dans le répertoire ```locale/``` et éxécuter l'outil ```generate_catalog.sh```

```
$ ./generate_catalog.sh 
msgfmt --use-fuzzy -c -o ./de/LC_MESSAGES/sltools.mo ./de/LC_MESSAGES/sltools.po 
msgfmt --use-fuzzy -c -o ./en/LC_MESSAGES/sltools.mo ./en/LC_MESSAGES/sltools.po 
msgfmt --use-fuzzy -c -o ./es/LC_MESSAGES/sltools.mo ./es/LC_MESSAGES/sltools.po 
msgfmt --use-fuzzy -c -o ./fr/LC_MESSAGES/sltools.mo ./fr/LC_MESSAGES/sltools.po 
msgfmt --use-fuzzy -c -o ./nl/LC_MESSAGES/sltools.mo ./nl/LC_MESSAGES/sltools.po 
msgfmt --use-fuzzy -c -o ./pl/LC_MESSAGES/sltools.mo ./pl/LC_MESSAGES/sltools.po 
```

# 7. Ajouter une nouvelle langue

Votre langue, ou une langue est absente et vous êtes désireux de l'ajouter au programme sl-tools ?
Rien de plus simple éxécuter dans le repertoire ```locale/``` l'outil ```new_catalog_lang.sh``` suivi du code langue de deux chiffres par exemple pour le français : 
```new_catalog_lang.sh fr```

Vous pouvez reprendre depuis l'étape [5. Traduire et corriger les catalogues de langues](#5-traduire-et-corriger-les-catalogues-de-langues)

