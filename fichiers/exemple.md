Titre de l'article
==================

Ceci est le chapeau de l'article. Il s'agit d'une courte introduction au sujet ou à la problématique. essayer d'être explicite et de donner envie au lecteur de poursuivre la lecture de l'article.

# 1. Titre de niveau 1 #
Paragraphe en «Normal». Vos fichiers HTML peuvent embarquer la CSS dans `<head></head>` ou utiliser le fichier CSS via un lien. Encodez vos fichier HTML en `iso-8859-1` et non en UTF-8 !!!. N'oubliez pas d'utiliser les codes HTML adéquates, en particulier pour `<` et `>` souvent présent dans le code ou dans les sessions intéractives (shell par exemple).

    # Une entrée typique de menu.lst
    title= DEBIAN GNU/Linux 2.6.24 (hdc3 - ext3)
    kernel= (hd1,2)/boot/vmlinuz-2.6.24-1-686 root=/dev/hdc3 vga=extended 
    initrd (hd1,2)/boot/initrd.img-2.6.24-1-686

Paragraphe en «Normal». On fait ici mention d'un élément de la configuration : L'étiquette `title` permet d'ajouter un titre dans les menus de GRUB. La commande `grub-install` permet l'installation du _bootloader_ (**Attention !** Ceci n'est pas un tag `<i>` mais le style «italic», idem pour le gras). Nous pouvons spécifier le mode graphique à utiliser avec l'option `vga` :

    # Une entrée typique de menu.lst
    title= DEBIAN GNU/Linux 2.6.24 (hdc3 - ext3)
    kernel= (hd1,2)/boot/vmlinuz-2.6.24-1-686 root=/dev/hdc3 <code_em>vga=extended</code_em>
    initrd (hd1,2)/boot/initrd.img-2.6.24-1-686

<pragma>/// Ceci est une note : Attention !///</pragma>
<note>Note notenote note notenote, note note note notenote. Bla notenote note notenote, note note note notenote. Bla notenote note notenote, note note note notenote. Bla notenote note notenote, note note note notenote. Bla notenote note notenote, note note note notenote. Bla notenote note notenote, note note note notenote. Bla notenote note notenote, note note note notenote. Bla notenote note notenote, note note note notenote.</note>
<pragma>/// Fin du bloc note///</pragma>

Les sessions de commandes intéractives sont à utiliser avec le style «console». On peut également mettre en évidence certaines parties :

    [10:06:29] denis@morgane:/proc % cat dma 
     2: floppy
     3: <code_em>parport0</code_em>
     4: cascade

Plus d'information sur GRUB sur le site officiel : <url>http://www.gnu.org/software/grub/</url>

N'embarquez pas vos images dans le HTML mais faites-en mention avec le style «pragma». Exemple :

![Figure 1 : Exemple d'écran de démarrage GRUB. Une légende peut être une simple phrase ou même la mention du numéro de figure. Cependant, pour certaines articles il peut s'agir de plusieurs paragraphes, d'où la nécessiter d'utiliser le style «pragma».](grub_figure1.png)

Lorsqu'on décrit une interface graphique ou texte (pas les lignes de commandes, les interfaces en mode texte comme Midnight Commander par exemple), il est possible de faire référence aux menus et option avec le style «menu». Exemple : Cochez l'option <menu>Auto-connexion</menu> dans la fenêtre des options qui apparaît via le menu <menu>Fichier > Préférences</menu>.

Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla.

## 1.1 Titre de niveau 2 ##
Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla.

Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla.

### 1.1.1 Titre de niveau 3 ###
Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla.

Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla.

#### 1.1.1.1 Titre de niveau 4 ####
Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla.

Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla. Bla blabla bla blabla, bla bla bla blabla.

