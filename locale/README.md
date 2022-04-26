- [1. Introduction](#1-introduction)
- [2. Prerequies](#2-prerequies)
- [3. Information](#3-information)
- [4. Extraire les strings langue du code](#4-extraire-les-strings-langue-du-code)
- [5. Traduire et corriger les catalogues de langues](#5-traduire-et-corriger-les-catalogues-de-langues)
- [6. Generé les catalogues de langues pour les systemes](#6-generé-les-catalogues-de-langues-pour-les-systemes)
- [7. Ajouter une nouvelle langue](#7-ajouter-une-nouvelle-langue)
# 1. Introduction
Ce répertoire contient les traductions SL-Tools et les outils pour les manipulations.

Le code source de SL-Tools contienent des chaines de langue par defaut en anglais (langue de base).

C'est chaines sont reconnu, car placer entre la fonction "m_tr" (message_translator).
Cette fonction est sous la forme de ```$(m_tr "TEXT %s %s" "valeur1" "valeur1")``` qui respecte le principe de GETTEXT
# 2. Prerequies
Vous avez besoin que l'outil gettext soi installer sur votre machine ainsi que msgfmt et find qui sont requis.
Pour plus d'information sur gettext : https://fr.wikipedia.org/wiki/GNU_gettext

# 3. Information
Si vous modifiez dans le code une valeur "m_tr" ou ajouter de nouveau "m_tr" vous devez recreer le catalogue d'origine contenant les strings langues d'origine.

# 4. Extraire les strings langue du code
Executer simplement dans le repertoire locale l'outil ```extract_str_code.sh```, celui ci va generer un fichier sltools.pot à jour, ainsi que creer les fichiers sltools.po respectives a chaques langues existantes
./es/LC_MESSAGES/sltools.po, ./fr/LC_MESSAGES/sltools.po, ./nl/LC_MESSAGES/sltools.po, ./pl/LC_MESSAGES/sltools.po 

# 5. Traduire et corriger les catalogues de langues
C'est fichiers puevent être modifier par vos soins a fin de réaliser les traductions. Il est conseiller d'utiliser un outil editage de fichier PO telle que POedit (Win, Mac, Linux)
Pour plus d'information sur POedit visitez : https://poedit.net/download

PS: Il est important de vérifier et de s'assurer que la valeur "Plural-Forms" est correctement définie.

# 6. Generé les catalogues de langues pour les systemes
Lors que vos traductions sont bonne, il est temps de generer -a partir des fichier PO- les catalogues de langues systeme.
Pour ce faire rien de plus facile, rester dans le repertoire locale et executer l'outil ```generate_catalog.sh```

# 7. Ajouter une nouvelle langue

Votre langue, ou une langue est absent et vous êtes desireux de l'ajouter au programme sl-tools ?
Rien de plus simple executer dans le repertoire locale/ l'outil ```new_catalog_lang.sh``` suivis du code langue de deux chiffres par exemple pour le français : 
```new_catalog_lang.sh fr```

Vous pouvez reprendre depuis l'etape [5. Traduire et corriger les catalogues de langues](#5-traduire-et-corriger-les-catalogues-de-langues)

