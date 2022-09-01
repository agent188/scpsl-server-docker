SCP Secret Laboratory Dedicated Server with optionally install EXILED
===============
If your folder with server is empty, container automatically install SCP Secret Laboratory Dedicated Server via steamcmd.

Run container with EXILED:

`docker run --name scpsl -p "7777:7777/udp" -v ~/.config/EXILED:/home/scp/.config/EXILED -v ~/.config/SCP\ Secret\ Laboratory:/home/scp/.config/SCP\ Secret\ Laboratory -v ~/scpsl:/home/scp/scpsl -e EXILED_INSTALL=TRUE -e SCPSL_PORT=7777 -it angryagent/scpsl-server:latest`


Run container without EXILED:

`docker run --name scpsl -p "7777:7777/udp" -v ~/.config/SCP\ Secret\ Laboratory:/home/scp/.config/SCP\ Secret\ Laboratory -v ~/scpsl:/home/scp/scpsl -e SCPSL_PORT=7777 -it angryagent/scpsl-server:latest`

Update SCP SL and EXILED before starting the server:

`docker run --name scpsl -p "7777:7777/udp" -v ~/.config/EXILED:/home/scp/.config/EXILED -v ~/.config/SCP\ Secret\ Laboratory:/home/scp/.config/SCP\ Secret\ Laboratory -v ~/scpsl:/home/scp/scpsl -e SCPSL_UPDATE=TRUE -e EXILED_UPDATE=TRUE -e SCPSL_PORT=7777 -it angryagent/scpsl-server:latest`

Docker compose example:

```
version: "3.9" 
services:
    scpsl:
     image: angryagent/scpsl-server:latest
     stdin_open: true
     tty: true
     container_name: scpsl
     environment:
      - SCPSL_PORT=7777
     ports:
      - "7777:7777/udp"
     volumes:
      - /home/angry-agent/scpsl:/home/scp/scpsl
      - /home/angry-agent/.config/SCP Secret Laboratory:/home/scp/.config/SCP Secret Laboratory
      - /home/angry-agent/.config/EXILED:/home/scp/.config/EXILED
```

Options in environment:
===============

`SCPSL_PORT` - Port in LocalAdmin args

`EXTRA_ARGS` - Additional LocalAdmin args

`EXILED_INSTALL` - [Default: FALSE] install SCP SL with EXILED if directory with server is empty

`SCPSL_UPDATE` - [Default: FALSE] update SCP SL before starting the server

`BETA_BRANCH` - You can select beta branch for SCP SL via steamcmd

`BETA_PASSWORD` - Password for beta branch

`EXILED_UPDATE` - [Default: FALSE] update EXILED before starting the server

`EXILED_VERSION` - You can select EXILED version via exiled installer

`EXILED_PRE_RELEASES` - [Default: FALSE] include EXILED pre releases versions via exiled installer

`EXILED_GITHUB_TOKEN` - You can use github token via exiled installer

`EXIT_AFTER_UPDATE` - [Default: FALSE] stop container after update/install SCP SL/Exiled


SLIM version
===============

You can use slim version, it does not include a full-fledged mono, has the smallest weight

Run container without EXILED:

`docker run --name scpsl -p "7777:7777/udp" -v ~/.config/SCP\ Secret\ Laboratory:/home/scp/.config/SCP\ Secret\ Laboratory -v ~/scpsl:/home/scp/scpsl -e SCPSL_PORT=7777 -it angryagent/scpsl-server:slim`

Run container with EXILED:

`docker run --name scpsl -p "7777:7777/udp" -v ~/.config/EXILED:/home/scp/.config/EXILED -v ~/.config/SCP\ Secret\ Laboratory:/home/scp/.config/SCP\ Secret\ Laboratory -v ~/scpsl:/home/scp/scpsl -e EXILED_INSTALL=TRUE -e SCPSL_PORT=7777 -it angryagent/scpsl-server:slim`


Pterodactyl egg
==============

https://raw.githubusercontent.com/agent188/scpsl-server-docker/main/pterodactyl-egg.json
