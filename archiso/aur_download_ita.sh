#!/bin/bash
filename='aur.txt'
aur_repo=${PWD}/../aur/aur_repo
aur=${PWD}/../aur/aur
#UNCOMMENT TO ADD CUSTOM REPO TO PACMAN.CONF (run just one time)
#cat << EOF >> pacman.conf
#[AUR]
#SigLevel = Optional TrustAll
#Server = file://${aur_repo}
#EOF
exist="already exists and is not an empty directory."
while read line; do
    if [[ $line != "#"* ]]; then
	    cd ${aur}
	    success=$((git clone https://aur.archlinux.org/${line}.git)2>&1)
	    if [[ $success == *"$esiste già"* ]]; then
		    echo "${line} exists"
            echo "${success}"
	    else
		    echo ${success}
		    cd ./${line}
		    makepkg -s --noconfirm
		    mv -v ./*.pkg.* ${aur_repo}
		    cd ..
		    
	    fi	
    fi
done < $filename
rm ${aur_repo}/AUR*
repo-add ${aur_repo}/AUR.db.tar.gz ${aur_repo}/*.pkg.*
