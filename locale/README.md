Ce répertoire contient les traductions SL-Tools et les scripts d'assistance pour les utiliser.

Si vous avez extrait une copie depuis git et que vous souhaitez accéder aux traductions, exécutez make_mo.sh .

msgfmt et find sont requis. Ce script générera des fichiers mo pour toutes les traductions.

Si vous souhaitez mettre à jour les fichiers po avec de nouvelles chaînes dans le fichier source, exécutez update_po.sh . 
Il rassemblera les chaînes traduisibles de tous les fichiers qui se terminent par ".sh" et depuis sltools le binaire.

Si vous souhaitez commencer à traduire dans une nouvelle langue, exécutez add_new_language.sh et transmettez le code de langue comme seul argument, par exemple :

$ ./add_new_language.sh fr

Il est important de vérifier et de s'assurer que la valeur "Plural-Forms" est correctement définie.

Pour ce modèle de langage de script est nécessaire. L'exécution de update_po.sh en générera un en tant que sltools.pot (que add_new_language.sh requiert).
