#!/bin/bash
# 
# based on https://github.com/snwh/ubuntu-post-install

tabs 4
clear
echo '#------------------------------------#'
echo '#        Ubuntu Setup Script         #'
echo '#------------------------------------#'

#----- FUNCTIONS -----#
dir="$(dirname "$0")"

. $dir/functions/upgrade
. $dir/functions/essentials
. $dir/functions/development
. $dir/functions/vm

#----- MESSAGE FUNCTIONS -----#

show_info() {
	echo -e "\033[1;34m$@\033[0m"
}

show_success() {
	echo -e "\033[1;32m$@\033[0m"
}

show_error() {
	echo -e "\033[1;31m$@\033[m" 1>&2
}

# Main
function main {
	echo ''
	show_info 'What would you like to do? '
	echo ''
	echo '1. Perform system update & upgrade?'
	echo '2. Install essentials?'
	echo '3. Install development?'
	echo '4. Install VMPlayer?'
	echo 'q. Quit?'
	echo ''
	show_info 'Enter your choice :' && read REPLY
	case $REPLY in
		1) upgrade;; 
		2) clear && essentials;; 
		3) clear && development;; 
		4) clear && vm;;
		[Qq]* ) echo '' && quit;; # Quit
		* ) clear && show_error '\aNot an option, try again.' && main;;
	esac
}

# Quit
function quit {
	read -p "Are you sure you want to quit? (Y)es, (N)o " REPLY
	case $REPLY in
	        [Yy]* ) exit 99;;
		[Nn]* ) clear && main;;
        	* ) clear && show_error 'Sorry, try again.' && quit;;
	esac
}

#----- RUN MAIN FUNCTION -----#
main

echo -e "\033[1;31m$@\033[m" 1>&2
}

