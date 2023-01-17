#! /bin/bash
#eliminare utente ausiliario
#dare una password a pviscone (con passwd, non setting kde)
#settare sfondo ssdm
pacman -Syy
paru
## PER PYTHON CONVIENE NON USARE SUDO CON PIP MA DEVI AGGIUNGERE PERCORSO AL PATH
sudo pip install astropy numba gammapy lightgbm pymc3 scikit-image moviepy pyspark tensorflow-probability fastai scikit-hep pycbc gwpy backtrader cirq graph-nets aghast numpythia cabinetry pyhf fastjet pybumphunter conda keras-tuner plotly selenium pytorch-lightning torch-geometric
#
sudo pip install latex2sympy2 inkscape-figures-vscode
sudo rm -rf /etc/skel

#CONTROLLA SE TUTTI I SERVIZI FUNZIONANO BENE
#systemctl list-unit-files | grep enabled

#Altro possibile software installabile:
# matlab, mathematica, comsolmultiphysics, cernvm-webapi, cvmfs-git, openfoam-org, wine, microcap, scilab-bin jupyter-scilab_kernel-git jupyter_contrib_nbextensions vmware-workstation cadabra2-git
# sembrerebbe che si siano perse le configurazioni di vim e tmux. Cerca di recuperare almeno ultisnip

##ATTIVARE SERVIZIO LOGID(logiops) se vuoi usare mouse logitech m720
sudo systemctl enable --now logid

#Ricorda che docker è disattivato, attiva il servizio per usarlo E AGGIUNGI UTENTE AL GRUPPO DOCKER (serve per estensione vscode)
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker.service
sudo systemctl enable --now containerd.service #non so se serve, nel dubbio usalo

# NOTA: ho rimosso balloo, akonadi (opzioni in .config), tolti diversi servizi in background e messo le attività private per risparmiare ram: https://www.reddit.com/r/kde/comments/aoj2h0/comment/eg1f18a/
# Se ti torna comodo metti nell'autoavvio mailspring e enpass

# Configura e attiva dnscrypt-proxy

#lista servizi
systemctl list-unit-files | grep enabled
# Disattiva servizi inutili per liberare ram
sudo systemctl disable --now teamviewerd.service vboxservice.service docker.service containerd.service cloud-init.service cloud-config.service cloud-final.service cloud-init-local.service livecd-alsa-unmuter.service livecd-talk.service




###################################################################################################
################################### SCRIPT UTILI ##################################################

#Quando l'icona di openboard sparisce
gsettings set org.onboard.icon-palette.portrait x 0
gsettings set org.onboard.icon-palette.portrait y #somma resY dei 2 schermi -20 (es. 2140 per 2 1080p)



########################################################################################################################################################################################################################################################


########## DA FARE in REPO (fatti già in locale) ########
# Per eseguire snapshot periodici timeshift richiede l'attivazione del servizio cronie (potrei anche lasciarlo disattivato in quanto faccio aggiornamenti di continuo e sarebbe solo un overhead inutile) ( systemctl enable --now cronie.service )


# Fai pulizia mastodontica del software che non usi
#cerca di togliere quanti più possibili librerie python dall'aur (ma anche dal package manager, salvali in un file di testo, non servono tutti quei pacchetti)

# Vedi se si riesce a tenere tutte le icone del desktop su entrambi gli schermi contemporaneamente

##Ritocchi estetici a kde (todolist al posto di pomodoro, barra secondo schermo, salva profili, crea floated)


#####FATTI NEW####
#sistema font nel terminale di dolphin
#Aggiunti all'aur ptpython logiops cppitertool gitkraken rstudio-desktop-bin (al posto di rstudio-desktop) ttf-times-new-roman input-remapper-beta-git tllocalmgr-git mailspring
#Tolti da aur fv espanso

#Aggiunti a pacman fzf xf86-video-dummy redshift python-poetry catch2 doxygen python-breathe ninja python-xlib libreoffice-fresh yarn pdf2svg rofi rxvt-unicode

#Replacement nuovo(vecchio): jupyter-nbclassic(jupyter-notebook)

#Modifiche pacman.conf (aggiunti colori), /etc/logid.cfg


# installa e aggiungi dall'aur simplenote-electron-bin, alacritty-themes, kde-rounded-corners,kwin-bismuth-bin
# Rimuovi onlyoffice dall'aur e install a libreoffice-fresh
# Rimuovi kmail (o come si chiama   )
# Sposta tutti i pacchetti python dall'aur a install.sh E TOGLI IL SUDO DAVANTI, installa sull'utente





#######FATTI.2####

# Vedi se c'è un modo per fare autoadattare la font size ad alacritty
# Capisci come far funzionare l'area della penna correttamente nel caso multi screen (forse già fatto in passato dovrebbe essere semplice)



###FATTI####
# Aggiungi xf86-input-wacom kcm-wacomtablet libwacom
#Replace jupyter con jupyter-notebook e crda con wireless-regdb
#Aggiungi speedtest-cli
#replace sdl con sdl12-compat (NON c'è)
#replace qemu con qemu-desktop e qemu-arch-extra con qemu-emulators-full
#replace pipewire-media-session con wireplumber
#aggiungi powerline-fonts
##AGGIUNGI XCLIP

# #Elimina 70-wacom da /usr/share/X11/xorg.conf.d

# Leva dalle palle iwd come servizio e metti wpa supplicant e networkmanager

# Aggiungi file /etc/X11/xorg.conf.d/50-tablet.conf (vedi su archwiki in Wacom Tablet)


## Aggiungi a airootfs file /etc/bluetooth/input.conf (cos'è?)
## Aggiungi espanso (NB: se lo aggiungi ad archiso nota che bisogna attivare il servizio) (potrebbe avere senso copiare le configurazioni ma non attivarlo, può essere tedioso se attivo all'insaputa)

#PER SISTEMARE EDUROAM:(aggiungi file /etc/NetworkManager/NetworkManager.conf e disattiva systemd-networkd.service

#Removed /etc/systemd/system/dbus-org.freedesktop.network1.service.
#Removed /etc/systemd/system/multi-user.target.wants/systemd-networkd.service.
#Removed /etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service.
#Removed /etc/systemd/system/sockets.target.wants/systemd-networkd.socket.

#)



##AUR##
# Aggiungi iio-sensor-proxy-git (AUR) kded-rotation-git (Aur)
# Aggiungi detect-tablet-mode-git
# Aggiungi digimend-kernel-drivers-dkms-git (Aur)
#aggiungi da aur spotify e spotify-adblock-git
#replace r-studio-desktop-bin con r-studio-desktop
# Vedi se serve qualche cosa di c++ tipo conan e installa libreria numeria alternativa ad armadillo tipo eigen
#aggiungi yoga-usage-mode-dkms-git (AUR)



###COSE DA SISTEMARE###
# Capisci perchè android studio necessita di sudo



##########################COSE GIA FATTE###################

#replace kvantum-qt5 with kvantum
#delete spyder
#installa pdfgrep
#Aggiungere smplayer
#CAMBIARE TENSORFLOW E PYTHON-TENSORFLOW AGGIUNGENDO OPT
# aggiunto font adobe-source-han-sans-otc-fonts
#downgrade
#rimuovi insync
