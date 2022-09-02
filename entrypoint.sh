#!/bin/bash
umask 000
if [[ $SERVER_PORT ]]; then
	export SCPSL_PORT=$SERVER_PORT
fi
if [[ ! -d ~/scpsl ]]; then
	mkdir ~/scpsl
fi
if [[ ! -d ~/.config/SCP\ Secret\ Laboratory ]]; then
        mkdir -p ~/.config/SCP\ Secret\ Laboratory
fi
if [[ ! -d ~/.config/EXILED ]]; then
        mkdir -p ~/.config/EXILED
fi
if [[ ! -d ~/steamcmd ]]; then
	mkdir ~/steamcmd
	cd ~/steamcmd
	curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
fi
if [[ ! -f ~/Exiled.Installer-Linux ]]; then
	curl -L "https://github.com/Exiled-Team/EXILED/releases/download/5.3.0/Exiled.Installer-Linux" -o ~/Exiled.Installer-Linux
	chmod +x ~/Exiled.Installer-Linux
fi
function CheckExit() {
	if [[ $EXIT_AFTER_UPDATE == "TRUE" ]]; then
		exit
	fi
}
function InstallSCPSL() {
        if [[ $BETA_BRANCH ]]; then
                if [[ $BETA_PASSWORD ]]; then
                        BETA_PASSWORD="-betapassword \"$BETA_PASSWORD\""
                fi
                BETA_BRANCH="-beta \"$BETA_BRANCH\""
        fi
	~/steamcmd/steamcmd.sh +force_install_dir $HOME/scpsl +login anonymous +app_update 996560 $BETA_BRANCH $BETA_PASSWORD validate +quit
	if [[ $EXILED_UPDATE != "TRUE" && $EXILED_INSTALL != "TRUE" ]]; then
		CheckExit
	fi
}
function ExiledInstall() {
        if [[ $EXILED_VERSION ]]; then  
                EXILED_VERSION="--target-version $EXILED_VERSION"
        fi
	if [[ $EXILED_PRE_RELEASES == "TRUE" ]]; then
		EXILED_PRE_RELEASES="--pre-releases"
	fi
	if [[ $EXILED_GITHUB_TOKEN ]]; then
		EXILED_GITHUB_TOKEN="--github-token $EXILED_GITHUB_TOKEN"
	fi
        ~/Exiled.Installer-Linux $EXILED_VERSION $EXILED_PRE_RELEASES $EXILED_GITHUB_TOKEN
	CheckExit
}
if [[ $SCPSL_UPDATE == "TRUE" ]]; then
        InstallSCPSL
fi
if [[ $EXILED_UPDATE == "TRUE" ]]; then
	cd ~/scpsl
	ExiledInstall
fi
if [[ ! $(ls -A ~/scpsl) ]]; then
	InstallSCPSL
	cd ~/scpsl
	if [[ $EXILED_INSTALL == "TRUE" ]]; then
		ExiledInstall
	fi
fi
cd ~/scpsl
./LocalAdmin $SCPSL_PORT $EXTRA_ARGS
