It is an archiso configuration.
The ISO includes the calamares graphic installer with the btrfs configuration (and ubuntu-like btrfs subvolumes for snapshots managmentent).

> **Warning for Arch purists**: ArcHEP IS VERY BLOATED!!!
>
> ArcHEP ( KDE, X11, pipewire, btrfs) contains a lot of packages dedicated to machine learning, data analysis in high energy physics (root, GEANT4, etc.), coding and notetaking on 2-in-1 devices
>
> There are installed also a lot of drivers to run without problems on every device

**Need Archiso to run**

**All the packages installed are in the file archiso/packages.x86_64**

**WARNING**: the final ISO is large and the compression take a lot of time (5 hours on a i5 6600) 

You will find more info about archiso here: https://wiki.archlinux.org/title/Archiso

# How to

- Optional: If you want to put in the ISO you dotfiles you can add them in /archiso/airootfs/etc/skel . The skel folder is the folder that will be copied in your Home

- Optional: If you want to add or remove some packages add/remove them in ./archiso/packages.x86_64

- Optional: If you want to add or remove some services add/remove the links in the /archiso/airootfs/etc/systemd/system folder. See the ArchWiki for more info.

  You can see the services that i have enabled in ./archiso/services.txt

1. Run ./archiso/aur_download.sh . It downloads the packages listed in aur.txt from the AUR, builds them and create a local repo in ./aur/aur_repo

   **Note that some build can easily fail. Maybe some packages have some dependencies that are not in the Arch repos or the PKGBUILD file has to be modified. **

   **I have added the dependencies that have to be downloaded from the AUR in ./archiso/dependencies but i'm not sure that's all**

   - For Update the AUR packages that you have already built you can run the update_aur.sh script

   

2. Add the path of your custom repo ./aur/aur_repo in ./archiso/pacman.conf in the section [AUR] (you have to insert the complete path)

3. Run a script in ./installation_scripts. The names is self explainatory

4. You will find your ISO in \$HOME/alci_iso_pure_out (if you are done delete the folder $HOME/alci_build)

5. Install the OS with the BTRFS filesystem. The installer is tuned to install the BTRFS filesystem, i never tested etx4.

6. After you have installed the OS delete the user pviscone (it is the liveuser, the installation doesn't remove it. My bad)
