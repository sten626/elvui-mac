#!/bin/bash
# elvui-mac.sh
# Steven Indzeoski
# Version 1.1.0

WOW_DIR=/Applications/World\ of\ Warcraft/Interface
E_XCD=64
E_XGIT=65

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
