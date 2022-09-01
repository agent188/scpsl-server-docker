FROM mono:slim
MAINTAINER Angry Agent, <angry_agent@vk.com>
RUN useradd scp -m
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY Exiled.Installer-Linux /
RUN chmod +x /Exiled.Installer-Linux
RUN mkdir /steamcmd
COPY --from=cm2network/steamcmd /home/steam/steamcmd /steamcmd
RUN chmod 777 -R /steamcmd
RUN apt-get update \
	&& apt-get install lib32gcc1 libicu63 --no-install-recommends -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/*
WORKDIR /home/scp
ENTRYPOINT ["/bin/bash","-c","/entrypoint.sh"]
USER scp
ENV USER=scp HOME=/home/scp
