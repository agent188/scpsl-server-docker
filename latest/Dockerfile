FROM mono:6.12.0.107
STOPSIGNAL SIGKILL
RUN useradd scp -m
COPY start.sh /home/scp
RUN chmod +x /home/scp/start.sh
COPY Exiled.Installer-Linux /home/scp
RUN chmod +x /home/scp/Exiled.Installer-Linux
RUN apt-get update \
	&& apt-get install lib32gcc1 libicu63 --no-install-recommends -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/*
WORKDIR /home/scp
ENTRYPOINT ["/bin/bash","-c","/home/scp/start.sh"]
USER scp
RUN mkdir /home/scp/scpsl && \
	mkdir /home/scp/.config && \
	mkdir /home/scp/.config/SCP\ Secret\ Laboratory && \
	mkdir /home/scp/.config/EXILED && \
	mkdir /home/scp/steamcmd
COPY --from=cm2network/steamcmd /home/steam/steamcmd /home/scp/steamcmd
