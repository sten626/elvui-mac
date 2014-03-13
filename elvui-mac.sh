#!/bin/bash
# elvui-mac.sh
# Steven Indzeoski
# Version 1.0.0

# Check if git is installed.
if hash git 2>/dev/null; then
	cd /Applications/World\ of\ Warcraft/Interface/

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
		git clone http://git.tukui.org/Elv/elvui.git
		cd AddOns/
		ln -s ../ElvUI/ElvUI/ ElvUI
		ln -s ../ElvUI/ElvUI_Config/ ElvUI_Config
		echo "ElvUI installed."
	fi
else
	echo "You must install git first."
fi
