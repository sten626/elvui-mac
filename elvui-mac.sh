#!/bin/bash
# elvui-mac.sh
# Steven Indzeoski
# Version 1.1.0

WOW_DIR=/Applications/World\ of\ Warcraft/Interface
DESKTOP_INSTALL_PATH=~/Desktop/elvui-mac
E_XCD=64
E_XGIT=65

while getopts ":i" Option
do
	case $Option in
		i )
			echo "Installing script to desktop."
			cp $0 "$DESKTOP_INSTALL_PATH"
			chmod +x "$DESKTOP_INSTALL_PATH"
			exit 0
			;;
	esac
done
shift $(($OPTIND - 1))

# Check if git is installed.
if hash git 2>/dev/null; then
	cd "$WOW_DIR" || {
		echo "Unable to change to WoW directory." >&2
		exit $E_XCD
	}

	# Check if ElvUI is already installed.
	if [ -d "ElvUI" ]; then
		# Update ElvUI
		echo "Updating ElvUI..."
		cd ElvUI/
		git stash
		git pull
		echo "ElvUI updated."
	else
		# Install ElvUI
		echo "Installing ElvUI..."
		git clone --depth 1 http://git.tukui.org/Elv/elvui.git
		cd AddOns/
		ln -s ../ElvUI/ElvUI/ ElvUI
		ln -s ../ElvUI/ElvUI_Config/ ElvUI_Config
		echo "ElvUI installed."
	fi

	exit 0
else
	echo "You must install git first." >&2
	exit $E_XGIT
fi
