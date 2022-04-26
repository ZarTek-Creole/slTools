- [1. Introduction](#1-introduction)
- [2. Prerequies](#2-prerequies)
- [3. Information](#3-information)
- [4. Extraire les strings langue du code](#4-extraire-les-strings-langue-du-code)
- [5. Traduire et corriger les catalogues de langues](#5-traduire-et-corriger-les-catalogues-de-langues)
- [6. Generé les catalogues de langues pour les systemes](#6-generé-les-catalogues-de-langues-pour-les-systemes)
- [7. Ajouter une nouvelle langue](#7-ajouter-une-nouvelle-langue)
# 1. Introduction
Ce répertoire ```locale/``` contient les traductions de SL-Tools et les outils pour les manipulations de ceux-ci.

Le code source de SL-Tools contient des chaines(du texte) de langueen anglais par defaut qui est la langue de base.

C'est chaines sont reconnu dans le code dû qu'ils sont placer entre la fonction "m_tr" (message_translator).

Cette fonction est sous la forme de ```$(m_tr "TEXT %s, %s" "$valeur1" "$valeur2")``` qui respecte le principe de GETTEXT

```TEXT``` étant du text traductible et les deux ```%s``` étant des variables dynamique qui prend la valeur de ```$valeur1``` pour le premier et la valeur de ```$valeur2``` pour le deuxieme:

Le resultat afficher sera ```TEXT valeur1, valeur2``` 

Pour plus d'information sur gettext : https://fr.wikipedia.org/wiki/GNU_gettext
# 2. Prerequies
Vous avez besoin que l'outil gettext soi installer sur votre machine ainsi que msgfmt et find qui sont requis.

# 3. Information
Si vous modifiez dans le code une valeur d'un/plusieurs "m_tr" ou vous ajoutez de nouveau textes avec "m_tr":

 Vous devez recréer le catalogue d'origine qui contient les strings (textes) de la langues d'origine qui ce trouve dans le code source).

# 4. Extraire les strings langue du code
Executer simplement dans le repertoire ```locale/``` l'outil ```extract_str_code.sh```, celui ci va generer un fichier sltools.pot qui sera à jour, ainsi que creer chaque fichiers sltools.po respectives, pour chaques langues existantes

Exemple de fichier generer dans le repertoire ```locale/```:
```
./sltools.pot
./es/LC_MESSAGES/sltools.po,
./fr/LC_MESSAGES/sltools.po,
./nl/LC_MESSAGES/sltools.po,
./pl/LC_MESSAGES/sltools.po 
```

Exemple d'execution :
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
C'est fichiers peuvent être modifier par vos soins pour réaliser les traductions.

Il est vivement conseiller d'utiliser un outil editage de fichier PO telle que POedit (Win, Mac, Linux).

Pour plus d'information sur POedit visitez : https://poedit.net/download

- Noté bien: Il est important de vérifier et de s'assurer que la valeur "Plural-Forms" est correctement définie.

# 6. Generé les catalogues de langues pour les systemes
Lors que vos traductions sont bonne, il est temps de generer -a partir des fichier PO- les catalogues de langues systeme.

Pour ce faire rien de plus facile, rester dans le repertoire ```locale/``` et executer l'outil ```generate_catalog.sh```

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

Votre langue, ou une langue est absent et vous êtes desireux de l'ajouter au programme sl-tools ?
Rien de plus simple executer dans le repertoire ```locale/``` l'outil ```new_catalog_lang.sh``` suivis du code langue de deux chiffres par exemple pour le français : 
```new_catalog_lang.sh fr```

Vous pouvez reprendre depuis l'etape [5. Traduire et corriger les catalogues de langues](#5-traduire-et-corriger-les-catalogues-de-langues)

