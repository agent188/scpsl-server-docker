#!/bin/bash
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
	/home/scp/steamcmd/steamcmd.sh +force_install_dir /home/scp/scpsl +login anonymous +app_update 996560 $BETA_BRANCH $BETA_PASSWORD +app_update 996560 validate +quit
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
        /home/scp/Exiled.Installer-Linux $EXILED_VERSION $EXILED_PRE_RELEASES $EXILED_GITHUB_TOKEN
	CheckExit
}
if [[ $SCPSL_UPDATE == "TRUE" ]]; then
        InstallSCPSL
fi
if [[ $EXILED_UPDATE == "TRUE" ]]; then
	cd /home/scp/scpsl
	ExiledInstall
fi
if [[ ! $(ls -A /home/scp/scpsl) ]]; then
	InstallSCPSL
	cd /home/scp/scpsl
	if [[ $EXILED_INSTALL == "TRUE" ]]; then
		ExiledInstall
	fi
fi
cd /home/scp/scpsl
./LocalAdmin $SCPSL_PORT $EXTRA_ARGS
