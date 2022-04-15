```
           __         (█)    ( ▄▄▄▄(█)▄▄▄▄ )   ,---.         ( ) ▀     ▀ ( )
          |  \    ▄▄▄▄███▄▄▄▄ ▐░░░░░░░░░░░▌   ' S ,'\   \(/     \  ▀▀▀  /
  _______ | ██   ▐░░░░░█░░░░░▌▐░█▀▀▀▀▀▀▀█░▌  / L /   |  /▄\    ▄    ▄▄▄▄
 /       \| ██    ▀▀▀▀█░█▀▀▀▀ ▐░▌ ████▄ ▐░▌ . O ; ,. :  |█|   ▀▄▀  █     ▀▄
|  ██-█▀█▄| ██        ▐░▌     ▐░▌ █   █ ▐░▌ ' O | |: :  |█|____ ▄  ▀▀▀▀▄  L
 \▀█▄   \ | ██   ██   ▐░▌     ▐░▌ ▀████ ▐░▌ ' T | .; :  \█▀▀███| ▀▄▄▄▄▀    
  \█ ▄███\| ██        ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌ | L :    |  :/ /::::  ▄   ▄
 ___   ▄█▀| ██         █      ▐░░░░░░░░░░░▌  \ S \  / By/ /ZarTeK ▌   ▌
 \▄▄▄▄▄_█▀ \██        /)\      ▀▀▀▀▀▀▀▀▀▀▀    \`----' _/  \_       ▀   ▀
```
!!! | SL-Tools est en cours de réalisation
- [SL-Tools](#sl-tools)
  - [Quelques points](#quelques-points)
  - [Testé avec](#testé-avec)
  - [Les dépendances](#les-dépendances)
    - [Packages](#packages)
    - [Binaires](#binaires)
  - [Téléchargements](#téléchargements)
  - [Installation](#installation)
  - [Fichier de configuration](#fichier-de-configuration)
  - [Mode Intéractif](#mode-intreractif)
    - [Les menus](#les-menus)
      - [Menu main](#menu-main)
      - [Menu slFTP](#menu-slftp)
      - [Menu slTools](#menu-sltools)
  - [Mode Non-Intéractif](#mode-non-intreractif)
- [Vos besoins, suggestions, bugs:](#vos-besoins-suggestions-bugs)
 
# SL-Tools
## Quelques points
* Programme écrit en bash
* Un mode interative
* Un mode en ligne de commande (terminal)
* Installation automatique de FPC (Free Pascal Free)
* Installation (semi) automatique de slFTP
* Gestion sous screen des instances slFTP
## Testé avec
  * Debian GNU/Linux 11 (bullseye)
  * Free Pascal Compiler version 3.2.0+dfsg-12 [2021/01/25] for x86_64

## Les dépendances  
### Packages
* Git
* Screen
* sudo
* gettext
### Binaires
* [Liste des binaires](https://github.com/ZarTek-Creole/slTools/blob/master/usr/bin/sltools#L73)
## Téléchargements
```
git clone https://github.com/ZarTek-Creole/slTools.git
```
## Installation
```
└> sudo ./install.sh                                             
*-----------------------------------------*
* SL-Tools a été installé                 *
* le répertoire de configuration se       *
* trouve dans /etc/slftp et doit être     *
* renommé en sltools.cfg                  *
* Après vous pouvez éxécuter le programme *
* Avec la commande sltools (root/user)    *
*-----------------------------------------*
```
## Fichier de configuration
```
└> cp /etc/slftp/sltools.cfg.dist cp /etc/slftp/sltools.cfg
└> nano /etc/slftp/sltools.cfg
```
Vous êtes prêt à utiliser stools
## Mode Intéractif
```
└> sltools
```
Vous pouvez éxécuter sltools depuis n'importe quel dossier et utilisateur
### Les menus
#### Menu main
```
.....................................................................
                             Menu main
.....................................................................
1) Menu SLFTP
2) Menu SL-Tools
3) Menu cbFTP
4) Quitter
Sélectionnez l’opération: 
```
#### Menu slFTP
```
.....................................................................
                             Menu SLFTP
.....................................................................
1) Run                       3) Rejoindre                 5) Mettre à jour             7) Quitter
2) Arrêter                   4) Installer                 6) Retour au menu principal
Sélectionnez l’opération: 
```
#### Menu slTools
```
.....................................................................
                           Menu SL-Tools
.....................................................................
1) Configuration
2) Mettre à jour
3) Info
4) Désinstaller
5) Retour au menu principal
6) Quitter
Sélectionnez l’opération: 
```
## Mode Non-Intéractif
```
└> sltools -h
```
Vous pouvez éxécuter sltools depuis n'importe quel dossier et utilisateur

# Vos besoins, suggestions, bugs: 
N’hesitez pas à participer au projet, il n'est pas obligatoire de savoir développer.
Si vous rapportez des bugs, donnez des idées d'amélioration vous aidez déjà le projet.
Besoin d'aide ? Posez vos questions c'est également participer au projet.
[Et c'est par ici :-)](https://github.com/ZarTek-Creole/slTools/issues/new)


---
```
 ____|~\_      ____|~\_
[atkous|-]    [ Moon |-]
 (_)   (_)     (_)   (_)
```



