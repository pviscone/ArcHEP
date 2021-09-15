#!/bin/bash
filename='aur.txt'
aur_repo=~/Desktop/aur/aur_repo
aur=~/Desktop/aur/aur
while read line; do
    if [[ $line != "#"* ]]; then
	    cd ${aur}
	    cd ./${line}
	    success=$((git pull)2>&1)
	    if [[ $success != "Already up to date." ]]; then
		    echo "${line}:${success}"
		    makepkg -s --noconfirm --cleanbuild -f
		    rm ${aur_repo}/${line}*		
		    mv -v ./*.pkg.* ${aur_repo}
		    cd ..	
		    
	    else
		    echo "${line}:Nothing to do"
            echo "${success}"
	    fi	
    fi
done < $filename
rm ${aur_repo}/AUR*
repo-add ${aur_repo}/AUR.db.tar.gz ${aur_repo}/*.pkg.*
