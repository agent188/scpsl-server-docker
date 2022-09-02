FROM mono:slim
MAINTAINER Angry Agent, <angry_agent@vk.com>
RUN useradd container -m
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN apt-get update \
	&& apt-get install lib32gcc1 libicu63 curl --no-install-recommends -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/*
WORKDIR /home/container
ENTRYPOINT ["/bin/bash","-c","/entrypoint.sh"]
USER container
ENV USER=container HOME=/home/container
