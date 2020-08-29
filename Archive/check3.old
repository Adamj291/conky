#! /bin/bash

# SETUP NOTES
# Add to sudoers file via visudo
# includedir /etc/sudoers.d
# <username> ALL=(ALL) NOPASSWD: /home/<username>/.conky/check.sh

# Add to crontab -e
# */15 * * * * /home/<username>/.conky/check.sh > /home/<username>/.conky/updates.txt 2>&1

# Refresh Pacman package update db.
# sudo pacman -Fy &> /dev/null &&
# checkupdates &&

# Variables.

all=`checkupdates | wc -l`
allaur=`yay -Qu | wc -l`
ignored=`yay -Qu | grep "\[ignored\]" | wc -l`
# trueaur=$(($allaur - $all))

if (( $allaur <= $all ));
then 
	trueaur=$(($all - $allaur))
else
	trueaur=$(($allaur - $all))
fi

avaliable=$(($trueaur + $all))
all2=$(($trueaur + $all + $ignored))

# Greps local version line and renmoves the number via sed and set the variables.
kernel_l=`pacman -Q --info linux | grep Version  |  sed 's/Version         ://g'`
nvidia_l=`pacman -Q --info nvidia | grep Version  |  sed 's/Version         ://g'`
cinnamon_l=`pacman -Q --info cinnamon | grep Version  |  sed 's/Version         ://g'`

# Greps remote version line and renmoves the number via sed and set the variables.
kernel_r=`pacman -Si --info linux | grep Version  |  sed 's/Version         ://g'`
nvidia_r=`pacman -Si --info nvidia | grep Version  |  sed 's/Version         ://g'`
cinnamon_r=`pacman -Si --info cinnamon | grep Version  |  sed 's/Version         ://g'`

kernup=$(if [ $kernel_l = $kernel_r ]; then echo "Up to date"; else echo "Update avaliable"; fi) # Compares local to remote versions, applys correct string to variable
nvidup=$(if [ $nvidia_l = $nvidia_r ]; then echo "Up to date"; else echo "Update avaliable"; fi) # Compares local to remote versions, applys correct string to variable
cinnup=$(if [ $cinnamon_l = $cinnamon_r ]; then echo "Up to date"; else echo "Update avaliable"; fi) # Compares local to remote versions, applys correct string to variable

# displays local version numbers from the above variables, next to relevant string.
printf "\nLOCAL VERSIONS\n" && 
printf "Kernel: $kernel_l\n" && 
printf "Nvidia: $nvidia_l\n" && 
printf "Cinnamon: $cinnamon_l\n" && 

# displays remote version numbers from the above variables, next to relevant string.
printf "\nREMOTE VERSIONS\n" && 
printf "Kernel: $kernel_r - $kernup\n" && 
printf "Nvidia: $nvidia_r - $nvidup\n" && 
printf "Cinnamon: $cinnamon_r - $cinnup\n" && 
 
# Works out total avaliable packages, takes away and ignored and avaliable packages from user repository.
printf "\nUPDATE SUMMARY\n" &&
printf "Ignored Updates: " && printf $ignored &&
printf "\nTotal Arch and AUR updates: " && printf "$allaur" &&	
printf "\nAvaliable Arch updates only: " && printf "$all" &&
printf "\nAvaliable AUR updates only: " && printf "$trueaur" &&
printf "\nTotal Avaliable Updates: " && printf "$avaliable" &&
printf "\n" &&
printf "\nLAST CHECKED " && date "+%H:%M:%S - %d/%m/%y"
printf "\nUPDATE LIST\n\n" && yay -Qu -p		#checkupdates

# Table Project
# echo "package":"local Version":"Remote Version":"Update status" &&
# echo "Kernel":$kernel_l:$kernal_r:$kernup | column -t -s: &&
# echo "Kernel":$headers_l:$headers_r:$headup | column -t -s: &&
# echo "Kernel":$nvidia_l:$nvidia_r:$nvidup | column -t -s: &&
# echo "Kernel":$cinnamon_l:$cinnamon_r:$cinnup | column -t -s:

